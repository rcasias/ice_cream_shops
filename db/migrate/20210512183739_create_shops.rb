class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.float :rating
      t.string :hours_of_operation
      t.boolean :has_delivery
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
