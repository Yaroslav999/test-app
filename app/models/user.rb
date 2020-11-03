# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { student: 0, teacher: 1 }
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies
end
