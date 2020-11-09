require 'rails_helper'

RSpec.describe CashManagementsController, type: :controller do
  let(:company) { subject.current_user.companies.create(name: 'test', initial_cash_cents: 100, country: 'ENG') }
  let(:cash_management) { company.cash_managements.create(cash_in_cents: 10, cash_out_cents: 10,
                                                          month: 'November', year: '2020', company: company) }

  context 'when user login as student' do
    login_student
    it 'should have a current_user' do
      expect(subject.current_user).to_not eq(nil)
    end

    it 'should get edit' do
      get :edit, params: { company_id: company.id,id: cash_management.to_param }
      expect(response.successful?).to eq(true)
    end

    it 'should put update' do
      put :update, params: { company_id: company.id, id: cash_management.to_param,
                             cash_management: { month: 'December' } }
      cash_management.reload
      expect(cash_management.month).to eq('December')
      response.should redirect_to(company)
    end

    it 'should post create' do
      expect {
        post :create, params: { company_id: company.id,
                                cash_management: { cash_in: 10, cash_out: 10,
                                                   month: 'November', year: '2020', company: company } }
      }.to change(CashManagement, :count).by(+1)
    end
  end

  context 'when login teacher' do
    login_teacher

    it 'should redirect to root_path' do
      post :create, params: { company_id: company.id,
                              cash_management: { cash_in: 10, cash_out: 10,
                                                 month: 'November', year: '2020', company: company } }
      response.should redirect_to(root_path)
    end

    it 'should put update' do
      put :update, params: { company_id: company.id, id: cash_management.to_param,
                             cash_management: { month: 'December' } }
      cash_management.reload
      expect(cash_management.month).to eq('November')
      response.should redirect_to(root_path)
    end
  end
end
