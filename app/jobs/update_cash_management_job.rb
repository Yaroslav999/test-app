# frozen_string_literal: true

class UpdateCashManagementJob < ApplicationJob
  queue_as :default

  def perform
    CashManagement.find_each do |cash|
      new_cash = cash.cash_in_cents + cash.monthly_increase_cents
      cash.update!(cash_in_cents: new_cash)
    end
  end
end
