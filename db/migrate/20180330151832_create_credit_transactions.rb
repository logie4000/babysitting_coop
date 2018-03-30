class CreateCreditTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_transactions do |t|
      t.references :sender, index: true, foreign_key: { to_table: :users}
      t.references :recipient, index: true, foreign_key: { to_table: :users}
      t.string :chain_hash

      t.timestamps
    end
  end
end
