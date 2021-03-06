require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let(:company) { subject.current_user.companies.create(name: 'test', initial_cash_cents: 100, country: 'ENG') }

  context 'when user login as student' do
    login_student
    it 'should have a current_user' do
      expect(subject.current_user).to_not eq(nil)
    end

    it 'should get index' do
      get :index
      expect(response.successful?).to eq(true)
    end

    it 'should get edit' do
      get :edit, params: { id: company.to_param }
      expect(response.successful?).to eq(true)
    end

    it 'should get show' do
      get :show, params: { id: company.to_param }
      expect(response.successful?).to eq(true)
    end

    it 'should put update' do
      put :update, params: { id: company.to_param, company: { name: 'new name' } }
      company.reload
      expect(company.name).to eq('new name')
      response.should redirect_to(companies_path)
    end

    it 'should post create' do
      expect {
        post :create, params: { company: { name: 'name', initial_cash: 100, country: 'ENG'} }
      }.to change(Company, :count).by(+1)
    end
  end

  context 'when user login as teacher' do
    login_teacher

    it 'should redirect to root path' do
      expect do
        post :create, params: { company: { name: 'name', initial_cash: 100, country: 'ENG'} }
      end.to raise_error
    end

    it 'should redirect to root path' do
      expect do
        put :update, params: { id: company.to_param, company: { name: 'new name' } }
      end.to raise_error
      company.reload
      expect(company.name).to eq('test')
    end
  end
end
