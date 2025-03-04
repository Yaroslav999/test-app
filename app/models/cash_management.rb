# frozen_string_literal: true

class CashManagement < ApplicationRecord
  monetize :cash_in_cents, numericality: { greater_than: 0 }
  monetize :cash_out_cents, numericality: { greater_than: 0 }

  belongs_to :company, touch: true

  validates :cash_in_cents, :cash_out_cents, :year, :month, :company, presence: true
  validates_uniqueness_of :company_id, scope: %i[month year]
  validates :cash_in_cents, numericality: { greater_than_or_equal_to: 0 }
  validates :cash_out_cents, numericality: { greater_than_or_equal_to: 0 }
  validate :validate_cashflow

  def validate_cashflow
    if cash_in_cents < cash_out_cents
      errors.add(:cash_in_cents, "should be greater than cash out")
    end
  end
end
