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

ActiveRecord::Schema[7.0].define(version: 2022_03_27_235747) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "rank"
    t.string "suit"
    t.integer "sort_value"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identifier"
    t.index ["identifier"], name: "index_cards_on_identifier"
    t.index ["rank", "suit"], name: "index_cards_on_rank_and_suit"
  end

  create_table "games", force: :cascade do |t|
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "winning_hand_id"
  end

  create_table "hand_references", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.integer "rank"
    t.string "identifier"
    t.boolean "requires_suit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_hand_references_on_identifier"
  end

  create_table "hands", force: :cascade do |t|
    t.string "raw_string"
    t.integer "game_id"
    t.integer "player_id"
    t.integer "hand_reference_id"
    t.integer "card_1_id"
    t.integer "card_2_id"
    t.integer "card_3_id"
    t.integer "card_4_id"
    t.integer "card_5_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "win_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
