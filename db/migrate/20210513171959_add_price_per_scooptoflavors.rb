class AddPricePerScooptoflavors < ActiveRecord::Migration[5.2]
  def change
    add_column :flavors, :price_per_scoop, :decimal
  end
end
