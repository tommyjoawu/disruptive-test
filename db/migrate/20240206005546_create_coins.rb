class CreateCoins < ActiveRecord::Migration[7.0]
  def change
    create_table :coins do |t|
      t.string :description
      t.string :code
      t.float :monthly_interest

      t.timestamps
    end
  end
end
