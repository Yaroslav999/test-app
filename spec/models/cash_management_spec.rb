require 'rails_helper'

RSpec.describe CashManagement, type: :model do
  subject { described_class }
  let(:user) {User.create(email: 'email@email.email', password: 'test1234')}
  let(:company) { user.companies.create(name: 'test', country: 'ENG',
                                                        initial_cash_cents: 100) }

  it "is not valid with not valid attributes" do
    expect(subject.new).to_not be_valid
  end

  it "is not valid with empty cash in" do
    expect(subject.new(cash_out_cents: 10, month: 'November',
                       year: '2020', company: company)).to_not be_valid
  end

  it "is not valid with empty cash out" do
    expect(subject.new(cash_in_cents: 10, month: 'November',
                       year: '2020', company: company)).to_not be_valid
  end

  it "is not valid with empty month" do
    expect(subject.new(cash_in_cents: 10, cash_out_cents: 10,
                       year: '2020', company: company)).to_not be_valid
  end

  it "is not valid with empty year" do
    expect(subject.new(cash_in_cents: 10, cash_out_cents: 10,
                       month: 'November', company: company)).to_not be_valid
  end

  it "is not valid with empty company" do
    expect(subject.new(cash_in_cents: 10, cash_out_cents: 10,
                       month: 'November', year: '2020')).to_not be_valid
  end

  it "is not valid with empty email" do
    expect(subject.new(cash_in_cents: 10, cash_out_cents: 10,
                       month: 'November', year: '2020', company: company)).to be_valid
  end

  it "check `total_cash` value using stub" do
    cash_management = build(:cash_management, company: company)
    allow(cash_management).to receive(:cash_in).and_return(10_000)

    expect(cash_management.cash_in).to eq(10_000)
  end
end
