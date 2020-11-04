require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  login_user
  let(:company) { subject.current_user.companies.create(name: 'test', country: 'ENG') }

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
    post :create, params: { company: { name: 'name', country: 'ENG'} }
    expect {
      post :create, params: { company: { name: 'name', country: 'ENG'} }
    }.to change(Company, :count).by(+1)
  end
end
