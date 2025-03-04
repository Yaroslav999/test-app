# frozen_string_literal: true

class Company < ApplicationRecord
  monetize :initial_cash_cents, numericality: { greater_than: 0 }
  mount_uploader :logo, LogoUploader

  has_many :cash_managements, dependent: :delete_all
  belongs_to :user

  validates :initial_cash_cents, :name, :country, presence: true
  validates :country, presence: true
  validates :initial_cash_currency, inclusion: { in: %w(USD EUR GBP) }

  def country_name
    country = ISO3166::Country[self.country]
    country.translations[I18n.locale.to_s] || country.name
  end
end
