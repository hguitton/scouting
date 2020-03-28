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

ActiveRecord::Schema.define(version: 2020_03_28_145029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "player_id"
    t.integer "user_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_comments_on_player_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.string "birthdate"
    t.string "status"
    t.string "nationality"
    t.string "agent_fr"
    t.string "agent_us"
    t.string "position"
    t.string "height_us"
    t.integer "height_eu"
    t.integer "weight_us"
    t.integer "weight_eu"
    t.string "salary"
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players_profiles", id: false, force: :cascade do |t|
    t.integer "player_id"
    t.integer "profile_id"
    t.index ["player_id"], name: "index_players_profiles_on_player_id"
    t.index ["profile_id"], name: "index_players_profiles_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "player_id"
    t.integer "user_id"
    t.string "name"
    t.string "team"
    t.string "country"
    t.string "min"
    t.string "points"
    t.string "fgp"
    t.string "three_fgp"
    t.string "orb"
    t.string "drb"
    t.string "trb"
    t.string "ast"
    t.string "blk"
    t.string "stl"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_seasons_on_player_id"
    t.index ["user_id"], name: "index_seasons_on_user_id"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
