class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :fingerprint
      t.string :api_key

      t.timestamps
    end

    add_index :users, :api_key
    add_index :users, :fingerprint
  end
end
