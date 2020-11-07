class CreateCashManagement < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_managements do |t|
      t.references :company, null: false, foreign_key: true, index: true
      t.string :month
      t.string :year
      t.money :cash_in
      t.money :cash_out

      t.timestamps
    end
  end
end
