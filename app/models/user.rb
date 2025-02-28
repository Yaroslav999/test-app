# frozen_string_literal: true

class User < ApplicationRecord
  attr_encrypted :email, key: Rails.application.credentials.secret_key_base.bytes[0..31].pack('c' * 32)
  enum role: { student: 0, teacher: 1, admin: 2 }
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies, dependent: :delete_all

  def full_name
    "#{first_name} #{last_name}"
  end
end
