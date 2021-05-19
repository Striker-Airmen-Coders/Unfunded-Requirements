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

ActiveRecord::Schema.define(version: 2021_05_19_135941) do

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
    t.string "req_number"
    t.integer "fiscal_year"
    t.string "create_by_org"
    t.string "status"
    t.string "operating_entity"
    t.string "title"
    t.string "pec"
    t.string "sag"
    t.string "panel"
    t.string "majcom_panel"
    t.string "majcom_directorate"
    t.string "eeic"
    t.string "object_class"
    t.string "esp"
    t.string "rccc"
    t.string "aai"
    t.integer "req_total"
    t.integer "funding_secured"
    t.integer "authorized_amount"
    t.integer "owner_priority"
    t.string "grp"
    t.string "unit"
    t.integer "final_FY"
    t.datetime "pop_start_date"
    t.datetime "pop_end_date"
    t.string "method_of_purchase"
    t.string "priority_level"
    t.string "budget_authority"
    t.datetime "needby_date"
    t.string "contract_number"
    t.string "reviewed_by"
    t.string "point_of_contact"
    t.string "installation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "office_id"
    t.integer "user_id"
    t.index ["office_id"], name: "index_reqs_on_office_id"
    t.index ["user_id"], name: "index_reqs_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
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
    t.string "grp"
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

  add_foreign_key "taggings", "tags"
end
