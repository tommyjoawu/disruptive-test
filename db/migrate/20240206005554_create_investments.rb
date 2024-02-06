class CreateInvestments < ActiveRecord::Migration[7.0]
  def change
    create_table :investments do |t|
      t.float :balance
      t.string :currency
      t.float :converted_to_btc
      t.float :converted_to_eth
      t.float :converted_to_ada
      t.timestamps
    end
  end
end
