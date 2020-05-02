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

ActiveRecord::Schema.define(version: 2020_05_02_183618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_comments_on_player_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "birthdate"
    t.string "nationality"
    t.string "agent_fr"
    t.string "agent_us"
    t.string "height_us"
    t.integer "height_eu"
    t.integer "weight_us"
    t.integer "weight_eu"
    t.string "salary_estimation"
    t.string "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "program"
    t.string "salary_real"
    t.string "links"
    t.bigint "level_id"
    t.bigint "updated_by_user_id"
    t.bigint "priority_id"
    t.bigint "status_id"
    t.bigint "position_id"
    t.string "photo"
    t.datetime "birthdate_timestamp"
    t.index ["level_id"], name: "index_players_on_level_id"
    t.index ["position_id"], name: "index_players_on_position_id"
    t.index ["priority_id"], name: "index_players_on_priority_id"
    t.index ["status_id"], name: "index_players_on_status_id"
    t.index ["updated_by_user_id"], name: "index_players_on_updated_by_user_id"
  end

  create_table "players_profiles", id: false, force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "profile_id"
    t.index ["player_id"], name: "index_players_profiles_on_player_id"
    t.index ["profile_id"], name: "index_players_profiles_on_profile_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "short"
    t.integer "order"
  end

  create_table "priorities", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "searches", force: :cascade do |t|
    t.integer "min_height"
    t.integer "max_height"
    t.integer "min_weight"
    t.integer "max_weight"
    t.integer "min_age"
    t.integer "max_age"
    t.integer "positions", default: [], array: true
    t.integer "profiles", default: [], array: true
    t.integer "statuses", default: [], array: true
    t.integer "available"
    t.integer "min_salary"
    t.integer "max_salary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "user_id"
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

  create_table "socials", force: :cascade do |t|
    t.string "link"
    t.bigint "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_socials_on_player_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "short"
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
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
