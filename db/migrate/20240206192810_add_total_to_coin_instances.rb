class AddTotalToCoinInstances < ActiveRecord::Migration[7.0]
  def change
    add_column :coin_instances, :total, :float
  end
end
