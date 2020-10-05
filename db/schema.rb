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

ActiveRecord::Schema.define(version: 2020_10_05_042217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "agents", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fullname"
    t.string "username"
    t.text "about"
    t.string "from"
    t.string "language"
    t.boolean "status", default: false
    t.boolean "admin", default: false
    t.string "slug"
    t.boolean "active", default: true
    t.index ["email"], name: "index_agents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_agents_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.text "summary"
    t.integer "bedroom"
    t.integer "bathroom"
    t.string "year_built"
    t.string "rent_price"
    t.string "price"
    t.string "short_stay_price"
    t.string "garage_size"
    t.string "number_of_floors"
    t.string "square_feet"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.string "property_features"
    t.string "lot_features"
    t.string "community_features"
    t.string "parking_type"
    t.string "video_url"
    t.string "slug"
    t.integer "status", default: 1
    t.boolean "active", default: true
    t.integer "featured", default: 0
    t.bigint "agent_id", null: false
    t.bigint "property_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "basement"
    t.boolean "centralair"
    t.boolean "dinning_room"
    t.boolean "walldrobe"
    t.boolean "familyroom"
    t.boolean "guest_toilet"
    t.boolean "laundry_room"
    t.boolean "disability"
    t.boolean "fireplace"
    t.boolean "main_floor"
    t.boolean "pantry"
    t.boolean "access_gate"
    t.boolean "balcony"
    t.boolean "fence"
    t.boolean "pool"
    t.boolean "staff_quarters"
    t.boolean "water_front"
    t.boolean "city_light"
    t.boolean "mountain_view"
    t.boolean "river_view"
    t.boolean "water_view"
    t.boolean "ocean_view"
    t.boolean "fitness_center"
    t.boolean "security_post"
    t.boolean "tennis_court"
    t.boolean "basketball_court"
    t.boolean "pet_allowed"
    t.boolean "recreation_facilities"
    t.boolean "electric_fencing"
    t.boolean "cable_tv"
    t.boolean "borehole"
    t.boolean "alarm"
    t.boolean "senior_community"
    t.boolean "surface_lot"
    t.boolean "covered"
    t.boolean "street_parking"
    t.boolean "garage"
    t.boolean "other_parking"
    t.string "swimming_pool"
    t.bigint "category_id", null: false
    t.index ["agent_id"], name: "index_properties_on_agent_id"
    t.index ["category_id"], name: "index_properties_on_category_id"
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "properties", "agents"
  add_foreign_key "properties", "categories"
  add_foreign_key "properties", "property_types"
end
