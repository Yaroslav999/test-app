# frozen_string_literal: true

class EncryptExistingEmailsJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      next if user.encrypted_email.present?

      user.update!(email: user[:email])
    end
  end
end
