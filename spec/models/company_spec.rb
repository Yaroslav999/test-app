require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { described_class }
  let(:user) { create(:user, password: 'test1234') }
  let(:company) { build_stubbed(:company, user: user) }

  it "is not valid with invalid attributes" do
    expect(subject.new).to_not be_valid
  end

  it "is not valid without user" do
    expect(subject.new(country: 'ENG', name: 'test')).to_not be_valid
  end

  it "is not valid without country" do
    expect(subject.new(name: 'test', user: user)).to_not be_valid
  end

  it "is not valid without name" do
    expect(subject.new(country: 'ENG', user: user)).to_not be_valid
  end

  it "is valid with valid attributes" do
    company = subject.new(name: 'Test Company', country: 'ENG', initial_cash_cents: 100, user: user)
    expect(company).to be_valid
  end

  it "is not valid with not name attributes" do
    expect(subject.new(country: 'ENG', user_id: user.id)).to_not be_valid
  end

  it "is valid with valid initial_cash_cents" do
    company = subject.new(name: 'Test Company', country: 'ENG', initial_cash_cents: 100, user: user)
    expect(company).to be_valid
  end

  it "check company validations" do
    expect(company).to be_valid
    expect(company.persisted?).to eq true
  end

  it "check `save` method" do
    company_mock = instance_double(Company, save: true)
    expect(company_mock).to receive(:save)
    company_mock.save
  end

  it "checks `country_name` method" do
    company = subject.new(country: 'US', name: 'Test Company', initial_cash_cents: 100, user: user)
    expect(company.country_name).to eq('United States')
  end

  it "is not valid with an invalid initial_cash_currency" do
    company = subject.new(name: 'Test Company', country: 'ENG', initial_cash_cents: 100, initial_cash_currency: 'INR', user: user)
    expect(company).to_not be_valid
    expect(company.errors[:initial_cash_currency]).to include('is not included in the list')
  end

  it "is valid with a valid initial_cash_currency" do
    company = subject.new(name: 'Test Company', country: 'ENG', initial_cash_cents: 100, initial_cash_currency: 'USD', user: user)
    expect(company).to be_valid
  end
end
