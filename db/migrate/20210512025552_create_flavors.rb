class CreateFlavors < ActiveRecord::Migration[5.2]
  def change
    create_table :flavors do |t|
      t.string :flavor_name
      t.boolean :dairy_free
      t.boolean :nut_free
      t.integer :price_per_scoop
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
