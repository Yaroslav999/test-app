# frozen_string_literal: true

class Company < ApplicationRecord
  monetize :initial_cash_cents, numericality: { greater_than: 0 }

  has_many :cash_managements, dependent: :delete_all
  belongs_to :user

  validates :initial_cash_cents, :name, :country, presence: true

  def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end
end
