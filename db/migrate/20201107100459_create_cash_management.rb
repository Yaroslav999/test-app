class CreateCashManagement < ActiveRecord::Migration[6.0]
  def change
    create_table :cash_managements do |t|
      t.references :company, null: false, foreign_key: true, index: true
      t.string :month, null: false
      t.string :year, null: false
      t.monetize :cash_in, null: false
      t.monetize :cash_out, null: false

      t.index [:company_id, :month, :year], unique: true
      t.timestamps
    end
  end
end
