require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user
  let(:company) { subject.current_user.companies.create(name: 'test', country: 'ENG',
                                                        initial_cash_cents: 100) }

  it 'should have a current_user' do
    expect(subject.current_user).to_not eq(nil)
  end

  it 'should get edit' do
    get :edit, params: { id: company.to_param }
    expect(response.successful?).to eq(true)
  end

  it 'should get update' do
    put :update, params: { id: company.to_param, user: { first_name: 'new name' } }
    expect(subject.current_user.first_name).to eq('new name')
    response.should redirect_to(companies_path)
  end
end
