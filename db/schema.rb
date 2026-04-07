# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_07_005351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "batches", force: :cascade do |t|
    t.date "arrival_date"
    t.string "batch_code"
    t.datetime "created_at", null: false
    t.string "duck_type"
    t.integer "estimated_female_count"
    t.integer "estimated_male_count"
    t.integer "estimated_unknown_count"
    t.integer "initial_duck_count"
    t.text "notes"
    t.decimal "purchase_price_per_duck"
    t.datetime "updated_at", null: false
    t.index ["batch_code"], name: "index_batches_on_batch_code", unique: true
    t.index ["duck_type"], name: "index_batches_on_duck_type"
  end

  create_table "expenses", force: :cascade do |t|
    t.decimal "amount"
    t.bigint "batch_id"
    t.string "category"
    t.datetime "created_at", null: false
    t.date "date"
    t.string "description"
    t.boolean "is_direct_cost", default: false
    t.text "notes"
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_expenses_on_batch_id"
    t.index ["date"], name: "index_expenses_on_date"
  end

  create_table "feed_consumptions", force: :cascade do |t|
    t.bigint "batch_id", null: false
    t.decimal "cost_per_kg"
    t.datetime "created_at", null: false
    t.date "date"
    t.bigint "feed_product_id", null: false
    t.bigint "feed_purchase_id", null: false
    t.text "notes"
    t.decimal "quantity_kg"
    t.decimal "total_cost"
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_feed_consumptions_on_batch_id"
    t.index ["date"], name: "index_feed_consumptions_on_date"
    t.index ["feed_product_id"], name: "index_feed_consumptions_on_feed_product_id"
    t.index ["feed_purchase_id"], name: "index_feed_consumptions_on_feed_purchase_id"
  end

  create_table "feed_products", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", null: false
    t.string "feed_stage"
    t.string "name"
    t.string "unit"
    t.datetime "updated_at", null: false
  end

  create_table "feed_purchases", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "feed_product_id", null: false
    t.text "notes"
    t.date "purchase_date"
    t.decimal "quantity_units"
    t.decimal "remaining_weight_kg"
    t.string "supplier_name"
    t.decimal "total_cost"
    t.decimal "total_weight_kg"
    t.decimal "unit_cost"
    t.datetime "updated_at", null: false
    t.index ["feed_product_id"], name: "index_feed_purchases_on_feed_product_id"
    t.index ["purchase_date"], name: "index_feed_purchases_on_purchase_date"
  end

  create_table "mortality_logs", force: :cascade do |t|
    t.bigint "batch_id", null: false
    t.string "cause"
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "duck_count"
    t.integer "estimated_female_count"
    t.integer "estimated_male_count"
    t.integer "estimated_unknown_count"
    t.text "notes"
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_mortality_logs_on_batch_id"
    t.index ["date"], name: "index_mortality_logs_on_date"
  end

  create_table "sale_items", force: :cascade do |t|
    t.integer "age_at_sale_days"
    t.bigint "batch_id", null: false
    t.datetime "created_at", null: false
    t.integer "duck_count"
    t.decimal "price_per_duck"
    t.bigint "sale_id", null: false
    t.string "sale_unit", default: "head"
    t.decimal "total_amount"
    t.datetime "updated_at", null: false
    t.decimal "weight_kg", precision: 10, scale: 2
    t.index ["batch_id"], name: "index_sale_items_on_batch_id"
    t.index ["sale_id"], name: "index_sale_items_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "customer_name"
    t.text "notes"
    t.string "payment_method"
    t.string "reference_no"
    t.date "sale_date"
    t.datetime "updated_at", null: false
    t.index ["sale_date"], name: "index_sales_on_sale_date"
  end

  add_foreign_key "expenses", "batches"
  add_foreign_key "feed_consumptions", "batches"
  add_foreign_key "feed_consumptions", "feed_products"
  add_foreign_key "feed_consumptions", "feed_purchases"
  add_foreign_key "feed_purchases", "feed_products"
  add_foreign_key "mortality_logs", "batches"
  add_foreign_key "sale_items", "batches"
  add_foreign_key "sale_items", "sales"
end
