# frozen_string_literal: true

class User < ApplicationRecord
  attr_encrypted :email, key: Rails.application.credentials.secret_key_base.bytes[0..31].pack('c' * 32)
  enum role: { student: 0, teacher: 1, admin: 2 }
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies, dependent: :delete_all
  validate :valid_email?

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def valid_email?
    decrypted_email = email_before_type_cast
    unless decrypted_email.present? && EMAIL_REGEX.match?(decrypted_email)
      errors.add(:email, "is not a valid email")
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
