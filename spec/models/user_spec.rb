require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class }

  it "is not valid with not valid attributes" do
    expect(subject.new).to_not be_valid
  end

  it "is not valid with empty first name" do
    expect(subject.new(first_name: nil, password: 'test1234')).to_not be_valid
  end

  it "is not valid with empty last name" do
    expect(subject.new(last_name: nil, password: 'test1234')).to_not be_valid
  end

  it "is not valid with empty email" do
    expect(subject.new(email: nil, password: 'test1234')).to_not be_valid
  end

  it "is not valid with empty email" do
    expect(subject.new(email: 'email@email.email',
                       first_name: 'first_name',
                       last_name: 'last_name',
                       password: 'test1234')).to be_valid
  end
end
