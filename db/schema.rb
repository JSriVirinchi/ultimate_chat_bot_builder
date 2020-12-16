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

ActiveRecord::Schema.define(version: 2020_12_16_114807) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "bots", force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.string "language"
    t.string "initconv"
    t.string "triggerpoint"
    t.time "starttime"
    t.time "endtime"
    t.date "startdate"
    t.date "enddate"
    t.integer "rebootconv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "days"
    t.boolean "active"
    t.string "reminder"
    t.string "conversation"
  end

  create_table "languages", force: :cascade do |t|
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "text_messages"
    t.string "node_type"
    t.integer "bot_id"
    t.integer "node_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "error_node"
    t.text "error_node_message"
    t.string "error_node_link_to_node"
    t.text "error_node_link_to_message"
    t.text "error_node_exit_message"
    t.string "error_node_transfer_to_agent"
    t.text "error_node_transfer_to_agent_message"
    t.string "message_type"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "node_type"
    t.integer "bot_id"
    t.integer "parent_id"
    t.string "name"
    t.string "set_next_action"
    t.text "exit_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "user_input_type"
    t.boolean "toggle_exit_message"
    t.text "transfer_to_agent_message"
    t.string "group_transfer_to_agent"
    t.boolean "toggle_transfer_to_agent_message"
    t.string "link_to_node"
    t.text "link_to_node_message"
    t.boolean "toggle_link_to_node"
  end

  create_table "reminders", force: :cascade do |t|
    t.text "reminder"
    t.integer "bot_id"
    t.integer "rebootconv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "triggerphrases", force: :cascade do |t|
    t.string "triggerphrase"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bot_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
