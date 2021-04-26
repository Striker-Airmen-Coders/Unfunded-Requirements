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

ActiveRecord::Schema.define(version: 2021_04_12_142658) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.integer "req_id"
    t.string "text"
    t.integer "number"
    t.date "date"
    t.boolean "boolean"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["req_id"], name: "index_answers_on_req_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "office_id"
    t.string "key"
    t.string "type", default: "text"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["office_id"], name: "index_questions_on_office_id"
  end

  create_table "reqs", force: :cascade do |t|
    t.integer "dbr_id"
    t.datetime "start_time"
    t.datetime "completion_time"
    t.string "name"
    t.string "email"
    t.string "title"
    t.string "office_symbol"
    t.string "work_phone_number"
    t.string "operating_entity"
    t.string "group"
    t.string "unit"
    t.string "pec"
    t.string "rccc"
    t.string "eeic"
    t.string "method_of_purchase"
    t.string "point_of_contact"
    t.decimal "req_total"
    t.decimal "funding_secured"
    t.string "installation", default: "Barksdale"
    t.string "office", default: "Barksdale"
    t.integer "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "office_id"
    t.integer "user_id"
    t.index ["office_id"], name: "index_reqs_on_office_id"
    t.index ["user_id"], name: "index_reqs_on_user_id"
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
    t.string "name"
    t.string "office_symbol"
    t.string "work_phone_number"
    t.integer "office_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["office_id"], name: "index_users_on_office_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
