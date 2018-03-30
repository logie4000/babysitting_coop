class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :fingerprint

      t.timestamps
    end
  end
end
