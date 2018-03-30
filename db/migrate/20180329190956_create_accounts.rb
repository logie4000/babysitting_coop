class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :fingerprint
      t.references :owner, foreign_key :true {to_table: :users}
      t.timestamps
    end

    add_index :accounts, :fingerprint
  end
end
