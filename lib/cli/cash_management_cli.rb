# frozen_string_literal: true

require 'thor'

module CLI
  class CashManagementCLI < Thor
    desc 'create COMPANY_ID MONTH CASH_IN CASH_OUT', 'Create a new cash management record'
    def create(company_id, month, cash_in, cash_out)
      company = Company.find_by(id: company_id)
      return puts 'Company not found' unless company

      cash_management = company.cash_managements.create(
        month: month.split(' ').first,
        year: month.split(' ').last,
        cash_in_cents: cash_in.to_i,
        cash_out_cents: cash_out.to_i
      )

      if cash_management.persisted?
        puts "Created cash management for #{month} successfully!"
      else
        puts "Failed to create: #{cash_management.errors.full_messages.join(', ')}"
      end
    end

    desc 'update ID CASH_IN CASH_OUT', 'Update an existing cash management record'
    def update(id, cash_in, cash_out)
      cash_management = CashManagement.find_by(id: id)
      return puts 'Record not found' unless cash_management

      if cash_management.update(cash_in_cents: cash_in.to_i, cash_out_cents: cash_out.to_i)
        puts 'Updated successfully!'
      else
        puts "Failed to update: #{cash_management.errors.full_messages.join(', ')}"
      end
    end
  end
end
