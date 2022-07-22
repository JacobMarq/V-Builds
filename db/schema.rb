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

ActiveRecord::Schema[7.0].define(version: 2022_07_22_105710) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "build_components", force: :cascade do |t|
    t.bigint "build_id", null: false
    t.bigint "component_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["build_id"], name: "index_build_components_on_build_id"
    t.index ["component_id"], name: "index_build_components_on_component_id"
  end

  create_table "builds", force: :cascade do |t|
    t.integer "price_cents", default: 0
    t.bigint "discount_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_builds_on_discount_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "shopping_session_id", null: false
    t.bigint "build_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["build_id"], name: "index_cart_items_on_build_id"
    t.index ["shopping_session_id"], name: "index_cart_items_on_shopping_session_id"
  end

  create_table "component_inventories", force: :cascade do |t|
    t.bigint "components_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["components_id"], name: "index_component_inventories_on_components_id"
  end

  create_table "component_resources", force: :cascade do |t|
    t.bigint "component_id", null: false
    t.integer "ub_rank"
    t.decimal "ub_benchmark", precision: 5, scale: 2
    t.integer "ub_samples"
    t.string "ub_link"
    t.integer "ne_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_component_resources_on_component_id"
  end

  create_table "component_specifications", force: :cascade do |t|
    t.bigint "component_id", null: false
    t.bigint "specification_option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_component_specifications_on_component_id"
    t.index ["specification_option_id"], name: "index_component_specifications_on_specification_option_id"
  end

  create_table "components", force: :cascade do |t|
    t.string "part_number"
    t.string "brand"
    t.string "model"
    t.integer "price_cents", default: 0
    t.bigint "type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_number"], name: "index_components_on_part_number", unique: true
    t.index ["type_id"], name: "index_components_on_type_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.integer "discount_percent"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["value"], name: "index_options_on_value", unique: true
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "build_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["build_id"], name: "index_order_items_on_build_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.integer "amount_cents", default: 0
    t.string "customer_id"
    t.string "payment_gateway"
    t.string "payment_intent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_orders_on_users_id"
  end

  create_table "shopping_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "total_cents", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_sessions_on_user_id"
  end

  create_table "specification_options", force: :cascade do |t|
    t.bigint "specification_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_specification_options_on_option_id"
    t.index ["specification_id"], name: "index_specification_options_on_specification_id"
  end

  create_table "specifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_specifications_on_name", unique: true
  end

  create_table "type_specifications", force: :cascade do |t|
    t.bigint "type_id", null: false
    t.bigint "specification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specification_id"], name: "index_type_specifications_on_specification_id"
    t.index ["type_id"], name: "index_type_specifications_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_types_on_name", unique: true
  end

  create_table "typical_usages", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.integer "gpu_precedent", null: false
    t.integer "cpu_precedent", null: false
    t.integer "ram_size_suggestion", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_builds", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "build_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["build_id"], name: "index_user_builds_on_build_id"
    t.index ["user_id"], name: "index_user_builds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "address", default: "", null: false
    t.string "city", default: "", null: false
    t.string "state", default: "", null: false
    t.integer "zipcode", default: 0, null: false
    t.string "phone_number", limit: 13, default: "", null: false
    t.integer "budget", default: 0, null: false
    t.boolean "rgb_preference", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "typical_usages_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["typical_usages_id"], name: "index_users_on_typical_usages_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "build_components", "builds"
  add_foreign_key "build_components", "components"
  add_foreign_key "builds", "discounts"
  add_foreign_key "cart_items", "builds"
  add_foreign_key "cart_items", "shopping_sessions"
  add_foreign_key "component_inventories", "components", column: "components_id"
  add_foreign_key "component_resources", "components"
  add_foreign_key "component_specifications", "components"
  add_foreign_key "component_specifications", "specification_options"
  add_foreign_key "components", "types"
  add_foreign_key "order_items", "builds"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users", column: "users_id"
  add_foreign_key "shopping_sessions", "users"
  add_foreign_key "specification_options", "options"
  add_foreign_key "specification_options", "specifications"
  add_foreign_key "type_specifications", "specifications"
  add_foreign_key "type_specifications", "types"
  add_foreign_key "user_builds", "builds"
  add_foreign_key "user_builds", "users"
  add_foreign_key "users", "typical_usages", column: "typical_usages_id"
end
