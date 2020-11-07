# frozen_string_literal: true

class CashManagement < ApplicationRecord
  monetize :cash_in_cents, numericality: { greater_than: 0 }
  monetize :cash_out_cents, numericality: { greater_than: 0 }

  belongs_to :company
end
