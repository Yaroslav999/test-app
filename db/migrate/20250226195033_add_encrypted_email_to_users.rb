class AddEncryptedEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :encrypted_email, :string
    add_column :users, :encrypted_email_iv, :string
  end
end
