class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.references :account, foreign_key: true
      t.string :fingerprint
      t.integer :value

      t.timestamps
    end

    add_index :credits, :fingerprint
  end
end
