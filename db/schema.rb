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

ActiveRecord::Schema.define(version: 2020_06_17_140703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchanges", force: :cascade do |t|
    t.bigint "shift_owner_id", null: false
    t.bigint "shift_answer_id", null: false
    t.boolean "accepted_owner"
    t.boolean "accepted_manager"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shift_answer_id"], name: "index_exchanges_on_shift_answer_id"
    t.index ["shift_owner_id"], name: "index_exchanges_on_shift_owner_id"
  end

  create_table "lines", force: :cascade do |t|
    t.string "name"
    t.string "transport_type"
    t.string "matricule"
    t.bigint "unit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["unit_id"], name: "index_lines_on_unit_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.date "date"
    t.bigint "line_id", null: false
    t.time "hour_start"
    t.time "hour_end"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "working_hours"
    t.index ["line_id"], name: "index_shifts_on_line_id"
    t.index ["user_id"], name: "index_shifts_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "matricule"
    t.boolean "manager", default: false, null: false
    t.bigint "unit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unit_id"], name: "index_users_on_unit_id"
  end

  add_foreign_key "exchanges", "shifts", column: "shift_answer_id"
  add_foreign_key "exchanges", "shifts", column: "shift_owner_id"
  add_foreign_key "lines", "units"
  add_foreign_key "shifts", "lines"
  add_foreign_key "shifts", "users"
  add_foreign_key "users", "units"
end
