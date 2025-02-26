class AddMonthlyIncreaseToCashManagements < ActiveRecord::Migration[6.0]
  def change
    add_column :cash_managements, :monthly_increase_cents, :integer, default: 0, null: false
  end
end
