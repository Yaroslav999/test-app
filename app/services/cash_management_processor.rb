# frozen_string_literal: true

class CashManagementProcessor
  def initialize(cash_management_repository)
    @cash_management_repository = cash_management_repository
  end

  def create_cash(company, params)
    cash_management = @cash_management_repository.new_record(company, params)
    cash_management.save ? cash_management : nil
  end

  def update_cash(cash_management, params)
    cash_management.update(params) ? cash_management : nil
  end
end
