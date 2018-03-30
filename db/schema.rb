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

ActiveRecord::Schema.define(version: 20180330151832) do

  create_table "accounts", force: :cascade do |t|
    t.string "fingerprint"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fingerprint"], name: "index_accounts_on_fingerprint", unique: true
    t.index ["owner_id"], name: "index_accounts_on_owner_id"
  end

  create_table "credit_transactions", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "chain_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_credit_transactions_on_recipient_id"
    t.index ["sender_id"], name: "index_credit_transactions_on_sender_id"
  end

  create_table "credits", force: :cascade do |t|
    t.integer "account_id"
    t.string "fingerprint"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_credits_on_account_id"
    t.index ["fingerprint"], name: "index_credits_on_fingerprint"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "fingerprint"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_users_on_api_key"
    t.index ["fingerprint"], name: "index_users_on_fingerprint"
  end

end
