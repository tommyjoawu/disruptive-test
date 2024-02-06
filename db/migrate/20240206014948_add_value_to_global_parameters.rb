class AddValueToGlobalParameters < ActiveRecord::Migration[7.0]
  def change
    add_column :global_parameters, :value, :string
  end
end
