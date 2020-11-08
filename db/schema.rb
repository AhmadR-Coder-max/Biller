# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_07_084638) do

  create_table "customers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.text "address_1"
    t.text "address_2"
    t.string "phone_1", default: "+92 "
    t.string "phone_2", default: "+92 "
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.decimal "quantity", default: "1.0"
    t.decimal "size"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.decimal "total_bill"
    t.text "item_names"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "Azhar Iqbal", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "customers", "users"
  add_foreign_key "items", "orders"
  add_foreign_key "orders", "customers"
end
