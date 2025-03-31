# frozen_string_literal: true

class UserFactory
  def self.create_user(params)
    defaults = {
      password: SecureRandom.hex(8),
      password_confirmation: params[:password] || SecureRandom.hex(8)
    }

    User.new(params.merge(defaults))
  end
end
