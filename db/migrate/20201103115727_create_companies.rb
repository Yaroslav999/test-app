class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.string :country, null: false
    end
  end
end
