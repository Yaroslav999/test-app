require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { described_class }
  let(:user) {create(:user, password: 'test1234')}
  let(:user1) { build_stubbed(:user) }  # Створюємо заглушку для користувача
  let(:company) { build_stubbed(:company, user: user1) }

  it "is not valid with not valid attributes" do
    expect(subject.new).to_not be_valid
  end

  it "is not valid with not user attributes" do
    expect(subject.new(country: 'ENG', name: 'test')).to_not be_valid
  end

  it "is not valid with not country attributes" do
    expect(subject.new(name: 'test', user_id: user.id)).to_not be_valid
  end

  it "is not valid with not name attributes" do
    expect(subject.new(country: 'ENG', user_id: user.id)).to_not be_valid
  end

  it "is not valid with empty email" do
    expect(subject.new(country: 'ENG',
                       initial_cash_cents: 100,
                       name: 'test',
                       user: User.create(password: 'test1234'))).to be_valid
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
end
