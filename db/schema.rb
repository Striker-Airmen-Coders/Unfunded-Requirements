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

ActiveRecord::Schema.define(version: 2021_04_06_191750) do

  create_table "reqs", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "completion_time"
    t.string "name"
    t.string "email"
    t.string "title"
    t.string "office_symbol"
    t.string "work_phone_number"
    t.string "is_18SA_or_F6790"
    t.string "group"
    t.string "unit"
    t.string "pec"
    t.string "rccc"
    t.string "eeic"
    t.string "method_of_purchase"
    t.string "point_of_contact"
    t.decimal "req_total"
    t.decimal "funding_secured"
    t.text "pitch"
    t.text "problem"
    t.text "solution"
    t.text "solution_progress"
    t.text "mission_impact"
    t.text "current_working_solution"
    t.text "investment_vs_workaround"
    t.boolean "attempted_self_help"
    t.string "installation", default: "Barksdale"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "installation"
    t.string "wing"
    t.string "group"
    t.string "unit"
    t.boolean "hq_role", default: false
    t.boolean "fma_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
