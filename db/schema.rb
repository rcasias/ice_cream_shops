# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_14_204122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flavors", force: :cascade do |t|
    t.string "flavor_name"
    t.boolean "dairy_free"
    t.boolean "nut_free"
    t.integer "calories_per_scoop"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "price_per_scoop"
    t.integer "shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.float "rating"
    t.string "hours_of_operation"
    t.boolean "has_delivery"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "flavors", "shops"
end
