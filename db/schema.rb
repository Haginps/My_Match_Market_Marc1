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


ActiveRecord::Schema[7.1].define(version: 2023_11_28_145445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "previousdaypercentagechange"
    t.string "category"
    t.string "description"
  end

  create_table "channels", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_channels_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.date "date"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_histories_on_asset_id"
  end

  create_table "holdings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "asset_id", null: false
    t.float "purchased_price"
    t.integer "shares_amount"
    t.date "purchased_date"
    t.float "sold_price"
    t.date "sold_date"
    t.float "gain_loss"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_holdings_on_asset_id"
    t.index ["user_id"], name: "index_holdings_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["channel_id"], name: "index_posts_on_channel_id"
    t.index ["user_id"], name: "index_posts_on_user_id"

  create_table "players", force: :cascade do |t|
    t.string "position"
    t.string "club"
    t.integer "height"
    t.integer "weight"
    t.date "dob"
    t.string "nationality"
    t.integer "games_played"
    t.integer "goals"
    t.integer "assists"
    t.bigint "asset_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_players_on_asset_id"

  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.float "balance"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "channels", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "histories", "assets"
  add_foreign_key "holdings", "assets"
  add_foreign_key "holdings", "users"
  add_foreign_key "posts", "channels"
  add_foreign_key "posts", "users"
  add_foreign_key "players", "assets"
end
