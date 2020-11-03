# frozen_string_literal: true

class User < ApplicationRecord
  enum role: [:student, :teacher]
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
