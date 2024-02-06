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

ActiveRecord::Schema[7.0].define(version: 2024_02_06_192810) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coin_instances", force: :cascade do |t|
    t.integer "coin_id"
    t.integer "investment_id"
    t.float "value_at_the_time"
    t.string "currency"
    t.float "anual_profit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "coin_equivalent"
    t.float "total"
  end

  create_table "coins", force: :cascade do |t|
    t.string "description"
    t.string "code"
    t.float "monthly_interest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "global_parameters", force: :cascade do |t|
    t.string "description"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "value"
  end

  create_table "investments", force: :cascade do |t|
    t.float "balance"
    t.string "currency"
    t.float "converted_to_btc"
    t.float "converted_to_eth"
    t.float "converted_to_ada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parameters", force: :cascade do |t|
    t.string "description"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
