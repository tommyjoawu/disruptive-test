class CreateGlobalParameters < ActiveRecord::Migration[7.0]
  def change
    create_table :global_parameters do |t|
      t.string :description
      t.string :code

      t.timestamps
    end
  end
end
