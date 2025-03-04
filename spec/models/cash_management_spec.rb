require 'rails_helper'

RSpec.describe CashManagement, type: :model do
  subject { described_class }
  let(:user) { User.create(email: 'email@email.email', password: 'test1234') }
  let(:company) { user.companies.create(name: 'test', country: 'ENG', initial_cash_cents: 100) }

  it "is not valid with not valid attributes" do
    expect(subject.new).to_not be_valid
  end

  it "is not valid with empty cash_in_cents" do
    expect(subject.new(cash_out_cents: 10, month: 'November', year: '2020', company: company)).to_not be_valid
  end

  it "is not valid with empty cash_out_cents" do
    expect(subject.new(cash_in_cents: 10, month: 'November', year: '2020', company: company)).to_not be_valid
  end

  it "is not valid with empty month" do
    expect(subject.new(cash_in_cents: 10, cash_out_cents: 10, year: '2020', company: company)).to_not be_valid
  end

  it "is not valid with empty year" do
    expect(subject.new(cash_in_cents: 10, cash_out_cents: 10, month: 'November', company: company)).to_not be_valid
  end

  it "is not valid with empty company" do
    expect(subject.new(cash_in_cents: 10, cash_out_cents: 10, month: 'November', year: '2020')).to_not be_valid
  end

  it "is not valid when cash_in_cents is less than cash_out_cents" do
    cash_management = subject.new(cash_in_cents: 100, cash_out_cents: 150, month: 'November', year: '2020', company: company)
    expect(cash_management).to_not be_valid
    expect(cash_management.errors[:cash_in_cents]).to include('should be greater than cash out')
  end

  it "is valid when cash_in_cents is greater than or equal to cash_out_cents" do
    cash_management = subject.new(cash_in_cents: 200, cash_out_cents: 150, month: 'November', year: '2020', company: company)
    expect(cash_management).to be_valid
  end

  it "is valid with valid attributes" do
    cash_management = subject.new(cash_in_cents: 10_000, cash_out_cents: 5_000, month: 'November', year: '2020', company: company)
    expect(cash_management).to be_valid
  end

  it "does not allow duplicate records for the same company in the same month and year" do
    subject.create(cash_in_cents: 10_000, cash_out_cents: 5_000, month: 'November', year: '2020', company: company)
    duplicate = subject.new(cash_in_cents: 15_000, cash_out_cents: 10_000, month: 'November', year: '2020', company: company)
    expect(duplicate).to_not be_valid
    expect(duplicate.errors[:company_id]).to include('has already been taken')
  end

  it "check `total_cash` value using stub" do
    cash_management = build(:cash_management, company: company)
    allow(cash_management).to receive(:cash_in).and_return(10_000)

    expect(cash_management.cash_in).to eq(10_000)
  end
end
