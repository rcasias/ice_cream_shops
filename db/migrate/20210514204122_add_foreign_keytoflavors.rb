class AddForeignKeytoflavors < ActiveRecord::Migration[5.2]
  def change
    add_column :flavors, :shop_id, :integer
    add_foreign_key :flavors, :shops
  end
end
