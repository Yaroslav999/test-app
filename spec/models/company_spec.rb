require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { described_class }
  let(:user) {User.create(password: 'test1234')}

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
                       name: 'test',
                       user: User.create(password: 'test1234'))).to be_valid
  end
end
