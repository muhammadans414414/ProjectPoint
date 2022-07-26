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

ActiveRecord::Schema[7.0].define(version: 2022_08_16_045144) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "dependents", force: :cascade do |t|
    t.string "name"
    t.string "phone", null: false
    t.string "residence_phone", null: false
    t.date "date_of_birth"
    t.text "address", null: false
    t.string "cnic"
    t.string "nationality"
    t.string "action"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dependents_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "title", null: false
    t.string "major", null: false
    t.string "institute"
    t.date "graduation_date", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.string "name"
    t.integer "relation"
    t.string "mobile", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_emergency_contacts_on_user_id"
  end

  create_table "personal_informations", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.string "father_name", null: false
    t.date "date_of_birth"
    t.integer "marital_status"
    t.string "spouse_name"
    t.integer "religion"
    t.string "cnic", null: false
    t.date "cnic_expiry_date"
    t.boolean "disability", default: false, null: false
    t.string "designation", null: false
    t.string "employee_code", null: false
    t.string "place_of_birth"
    t.string "domicile"
    t.string "nationality"
    t.string "passport_number"
    t.date "passport_validity_date"
    t.string "height"
    t.bigint "user_id", null: false
    t.integer "disability_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blood_group"
    t.string "profile_image"
    t.string "mobile", null: false
    t.string "residence_phone", null: false
    t.string "coordinator"
    t.string "office_phone"
    t.string "official_email", null: false
    t.string "personal_email", null: false
    t.text "residence_address", null: false
    t.text "permanent_address", null: false
    t.index ["user_id"], name: "index_personal_informations_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "full_name"
    t.string "short_name"
    t.text "staging_url"
    t.string "staging_test_username"
    t.string "staging_test_password"
    t.string "staging_database_name"
    t.text "live_url"
    t.string "live_test_username"
    t.string "live_test_password"
    t.string "live_database_name"
    t.string "status"
    t.text "ssh_url_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_projects", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "role_id", default: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "dependents", "users"
  add_foreign_key "educations", "users"
  add_foreign_key "emergency_contacts", "users"
  add_foreign_key "personal_informations", "users"
  add_foreign_key "user_projects", "projects"
  add_foreign_key "user_projects", "users"
  add_foreign_key "users", "roles"
end
