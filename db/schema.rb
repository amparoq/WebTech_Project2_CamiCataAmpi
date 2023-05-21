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

ActiveRecord::Schema[7.0].define(version: 2023_05_21_051123) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string "title"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id", null: false
    t.index ["ticket_id"], name: "index_attachments_on_ticket_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id", null: false
    t.bigint "executive_id", null: false
    t.index ["executive_id"], name: "index_comments_on_executive_id"
    t.index ["ticket_id"], name: "index_comments_on_ticket_id"
  end

  create_table "executive_metrics", force: :cascade do |t|
    t.date "date"
    t.string "type_of_metric"
    t.float "evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "executive_id", null: false
    t.bigint "ticket_id", null: false
    t.index ["executive_id"], name: "index_executive_metrics_on_executive_id"
    t.index ["ticket_id"], name: "index_executive_metrics_on_ticket_id"
  end

  create_table "executives", force: :cascade do |t|
    t.integer "assigned_tickets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_executives_on_user_id"
  end

  create_table "requiring_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_requiring_users_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "response"
    t.boolean "acceptance"
    t.float "evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ticket_id", null: false
    t.bigint "executive_id", null: false
    t.bigint "requiring_user_id", null: false
    t.index ["executive_id"], name: "index_responses_on_executive_id"
    t.index ["requiring_user_id"], name: "index_responses_on_requiring_user_id"
    t.index ["ticket_id"], name: "index_responses_on_ticket_id"
  end

  create_table "supervisors", force: :cascade do |t|
    t.boolean "administrator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_supervisors_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_tickets", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.date "creation_date"
    t.date "resolution_date"
    t.date "deadline_date"
    t.string "title"
    t.string "description"
    t.integer "priority"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "requiring_user_id", null: false
    t.bigint "executive_id", null: false
    t.index ["executive_id"], name: "index_tickets_on_executive_id"
    t.index ["requiring_user_id"], name: "index_tickets_on_requiring_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "telephone"
    t.string "email"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attachments", "tickets"
  add_foreign_key "comments", "executives"
  add_foreign_key "comments", "tickets"
  add_foreign_key "executive_metrics", "executives"
  add_foreign_key "executive_metrics", "tickets"
  add_foreign_key "executives", "users"
  add_foreign_key "requiring_users", "users"
  add_foreign_key "responses", "executives"
  add_foreign_key "responses", "requiring_users"
  add_foreign_key "responses", "tickets"
  add_foreign_key "supervisors", "users"
  add_foreign_key "tickets", "executives"
  add_foreign_key "tickets", "requiring_users"
end
