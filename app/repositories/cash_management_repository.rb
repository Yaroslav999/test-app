# frozen_string_literal: true

class CashManagementRepository
  def new_record(company, params)
    company.cash_managements.new(params)
  end
end
