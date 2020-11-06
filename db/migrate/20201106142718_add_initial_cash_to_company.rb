# frozen_string_literal: true

class AddInitialCashToCompany < ActiveRecord::Migration[6.0]
  def change
    add_monetize :companies, :initial_cash
  end
end
