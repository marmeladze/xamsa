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

ActiveRecord::Schema.define(version: 20140117004430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.string   "text"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "aasm_state"
    t.integer  "player1_id"
    t.integer  "player1_score"
    t.integer  "player2_id"
    t.integer  "player2_score"
    t.integer  "player3_id"
    t.integer  "player3_score"
    t.integer  "player4_id"
    t.integer  "player4_score"
    t.integer  "question_pack_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["player1_id"], name: "index_games_on_player1_id", using: :btree
  add_index "games", ["player2_id"], name: "index_games_on_player2_id", using: :btree
  add_index "games", ["player3_id"], name: "index_games_on_player3_id", using: :btree
  add_index "games", ["player4_id"], name: "index_games_on_player4_id", using: :btree
  add_index "games", ["question_pack_id"], name: "index_games_on_question_pack_id", using: :btree

  create_table "players", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
    t.string   "birthday"
    t.boolean  "sex"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

  create_table "question_packs", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "text"
    t.integer  "question_pack_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["question_pack_id"], name: "index_questions_on_question_pack_id", using: :btree

end
