require 'rails_helper'

RSpec.describe UserFactory do
  describe '.create_user' do
    it 'creates a valid user' do
      user = UserFactory.create_user(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        role: :student,
        password: 'password123',
        password_confirmation: 'password123'
      )

      expect(user).to be_a(User)
      expect(user.valid?).to be true
    end
  end
end
