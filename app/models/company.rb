# frozen_string_literal: true

class Company < ApplicationRecord
  monetize :initial_cash_cents, numericality: { greater_than: 0 }

  has_many :cash_managements
  belongs_to :user

  def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end

  def user_name
    "#{user.first_name} #{user.last_name}"
  end
end
