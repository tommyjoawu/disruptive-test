class AddCoinEquivalentToCoinInstances < ActiveRecord::Migration[7.0]
  def change
    add_column :coin_instances, :coin_equivalent, :float
  end
end
