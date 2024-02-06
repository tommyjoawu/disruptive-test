class CreateCoinInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :coin_instances do |t|
      t.integer :coin_id
      t.integer :investment_id
      t.float :value_at_the_time
      t.string :currency
      t.float :anual_profit

      t.timestamps
    end
  end
end
