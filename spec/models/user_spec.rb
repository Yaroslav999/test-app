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

  describe "email validation" do
    it "is valid with a correct email format" do
      user = User.new(email: "test@example.com", password: "test1234")
      expect(user).to be_valid
    end

    it "is not valid with an incorrect email format" do
      invalid_emails = ["invalid@", "user.com", "user@com", "user@.com", "user@com."]

      invalid_emails.each do |email|
        user = User.new(email: email, password: "test1234")
        user.valid?
        puts "Testing: #{email}, Errors: #{user.errors.full_messages}"
        expect(user).to_not be_valid, "#{email.inspect} should be invalid"
      end
    end

    it "is not valid with an empty email" do
      user = User.new(email: "", password: "test1234")
      expect(user).to_not be_valid
    end

    it "is case insensitive for valid emails" do
      user = User.new(email: "TEST@EXAMPLE.COM", password: "test1234")
      expect(user).to be_valid
    end
  end
end
