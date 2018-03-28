# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180327035351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "confirmations", force: :cascade do |t|
    t.integer  "document_id"
    t.string   "express_rating"
    t.string   "expert_conclusion"
    t.string   "confirmation"
    t.string   "document_type"
    t.string   "serial"
    t.string   "number"
    t.date     "issue_date"
    t.integer  "country_id"
    t.string   "education_organization"
    t.string   "issue_orgenization"
    t.string   "foreign_level"
    t.string   "rf_level"
    t.string   "reason"
    t.string   "person"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "confirmations", ["country_id"], name: "index_confirmations_on_country_id", using: :btree
  add_index "confirmations", ["document_id"], name: "index_confirmations_on_document_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "short_name",   null: false
    t.string   "long_name",    null: false
    t.string   "alpha2",       null: false
    t.string   "alpha3",       null: false
    t.string   "country_code", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "student_id",  null: false
    t.string   "doc_type",    null: false
    t.string   "doc_number",  null: false
    t.date     "exp_date",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "translation"
    t.string   "language",    null: false
  end

  add_index "documents", ["doc_number", "doc_type"], name: "index_documents_on_doc_number_and_doc_type", unique: true, using: :btree
  add_index "documents", ["student_id"], name: "index_documents_on_student_id", using: :btree

  create_table "educations", force: :cascade do |t|
    t.integer  "student_id",  null: false
    t.string   "edu_level",   null: false
    t.string   "language",    null: false
    t.text     "translation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "educations", ["student_id"], name: "index_educations_on_student_id", using: :btree

  create_table "floors", force: :cascade do |t|
    t.integer  "hostel_id",    null: false
    t.integer  "floor_number", null: false
    t.integer  "rooms_count",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "floors", ["hostel_id", "floor_number"], name: "index_floors_on_hostel_id_and_floor_number", unique: true, using: :btree
  add_index "floors", ["hostel_id"], name: "index_floors_on_hostel_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",          null: false
    t.integer  "speciality_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree
  add_index "groups", ["speciality_id"], name: "index_groups_on_speciality_id", using: :btree

  create_table "hostels", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "address",      null: false
    t.integer  "floors_count", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "hostels", ["name", "address"], name: "index_hostels_on_name_and_address", unique: true, using: :btree

  create_table "national_holidays", force: :cascade do |t|
    t.string   "name",           null: false
    t.date     "date",           null: false
    t.integer  "nationality_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "national_holidays", ["name", "date"], name: "index_national_holidays_on_name_and_date", unique: true, using: :btree
  add_index "national_holidays", ["nationality_id"], name: "index_national_holidays_on_nationality_id", using: :btree

  create_table "nationalities", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "nationalities", ["name"], name: "index_nationalities_on_name", unique: true, using: :btree

  create_table "passports", force: :cascade do |t|
    t.string   "serial",        null: false
    t.string   "number",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "passport_type", null: false
    t.text     "translation"
    t.string   "language",      null: false
  end

  add_index "passports", ["serial", "number"], name: "index_passports_on_serial_and_number", unique: true, using: :btree

  create_table "referrals", force: :cascade do |t|
    t.integer  "student_id",      null: false
    t.string   "referral_number", null: false
    t.date     "date",            null: false
    t.integer  "speciality_id",   null: false
    t.float    "payment",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "referrals", ["referral_number"], name: "index_referrals_on_referral_number", unique: true, using: :btree
  add_index "referrals", ["speciality_id"], name: "index_referrals_on_speciality_id", using: :btree
  add_index "referrals", ["student_id"], name: "index_referrals_on_student_id", using: :btree

  create_table "religion_holidays", force: :cascade do |t|
    t.string   "name",        null: false
    t.date     "date",        null: false
    t.integer  "religion_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "religion_holidays", ["name", "date"], name: "index_religion_holidays_on_name_and_date", unique: true, using: :btree
  add_index "religion_holidays", ["religion_id"], name: "index_religion_holidays_on_religion_id", using: :btree

  create_table "religions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "religions", ["name"], name: "index_religions_on_name", unique: true, using: :btree

  create_table "restrictions", force: :cascade do |t|
    t.integer  "student_left_id"
    t.integer  "student_right_id"
    t.string   "restriction"
    t.string   "restriction_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "restrictions", ["student_left_id"], name: "index_restrictions_on_student_left_id", using: :btree
  add_index "restrictions", ["student_right_id"], name: "index_restrictions_on_student_right_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "room_number", null: false
    t.integer  "place_count", null: false
    t.integer  "floor_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rooms", ["floor_id"], name: "index_rooms_on_floor_id", using: :btree
  add_index "rooms", ["room_number", "floor_id"], name: "index_rooms_on_room_number_and_floor_id", unique: true, using: :btree

  create_table "specialities", force: :cascade do |t|
    t.integer  "section_number",  null: false
    t.string   "section_name",    null: false
    t.integer  "group_number",    null: false
    t.string   "group_name",      null: false
    t.string   "subgroup_number", null: false
    t.string   "subgroup_name",   null: false
    t.string   "speciality_code", null: false
    t.string   "name",            null: false
    t.string   "edu_prog_code",   null: false
    t.string   "edu_area_code",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "student_lefts", force: :cascade do |t|
    t.integer  "nationality_id"
    t.integer  "religion_id"
    t.integer  "country_id"
    t.integer  "age"
    t.integer  "speciality_id"
    t.string   "edu_level"
    t.float    "payment"
    t.string   "sex"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "student_lefts", ["country_id"], name: "index_student_lefts_on_country_id", using: :btree
  add_index "student_lefts", ["nationality_id"], name: "index_student_lefts_on_nationality_id", using: :btree
  add_index "student_lefts", ["religion_id"], name: "index_student_lefts_on_religion_id", using: :btree
  add_index "student_lefts", ["speciality_id"], name: "index_student_lefts_on_speciality_id", using: :btree

  create_table "student_rights", force: :cascade do |t|
    t.integer  "nationality_id"
    t.integer  "religion_id"
    t.integer  "country_id"
    t.integer  "age"
    t.integer  "speciality_id"
    t.string   "edu_level"
    t.float    "payment"
    t.string   "sex"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "student_rights", ["country_id"], name: "index_student_rights_on_country_id", using: :btree
  add_index "student_rights", ["nationality_id"], name: "index_student_rights_on_nationality_id", using: :btree
  add_index "student_rights", ["religion_id"], name: "index_student_rights_on_religion_id", using: :btree
  add_index "student_rights", ["speciality_id"], name: "index_student_rights_on_speciality_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "passport_id",    null: false
    t.string   "ln",             null: false
    t.string   "fn",             null: false
    t.string   "sn"
    t.string   "sex",            null: false
    t.date     "bday",           null: false
    t.integer  "country_id",     null: false
    t.integer  "nationality_id"
    t.integer  "religion_id"
    t.date     "start_date"
    t.date     "finish_date"
    t.integer  "group_id"
    t.integer  "room_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "students", ["country_id"], name: "index_students_on_country_id", using: :btree
  add_index "students", ["group_id"], name: "index_students_on_group_id", using: :btree
  add_index "students", ["ln", "fn", "sn", "sex", "bday", "passport_id"], name: "index_on_students", unique: true, using: :btree
  add_index "students", ["nationality_id"], name: "index_students_on_nationality_id", using: :btree
  add_index "students", ["religion_id"], name: "index_students_on_religion_id", using: :btree
  add_index "students", ["room_id"], name: "index_students_on_room_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "confirmations", "countries"
  add_foreign_key "confirmations", "documents"
  add_foreign_key "documents", "students"
  add_foreign_key "educations", "students"
  add_foreign_key "floors", "hostels"
  add_foreign_key "groups", "specialities"
  add_foreign_key "national_holidays", "nationalities"
  add_foreign_key "referrals", "specialities"
  add_foreign_key "referrals", "students"
  add_foreign_key "religion_holidays", "religions"
  add_foreign_key "restrictions", "student_lefts"
  add_foreign_key "restrictions", "student_rights"
  add_foreign_key "rooms", "floors"
  add_foreign_key "student_lefts", "countries"
  add_foreign_key "student_lefts", "nationalities"
  add_foreign_key "student_lefts", "religions"
  add_foreign_key "student_lefts", "specialities"
  add_foreign_key "student_rights", "countries"
  add_foreign_key "student_rights", "nationalities"
  add_foreign_key "student_rights", "religions"
  add_foreign_key "student_rights", "specialities"
  add_foreign_key "students", "countries"
  add_foreign_key "students", "groups"
  add_foreign_key "students", "nationalities"
  add_foreign_key "students", "passports"
  add_foreign_key "students", "religions"
  add_foreign_key "students", "rooms"
end
