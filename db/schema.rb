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

ActiveRecord::Schema.define(version: 2019_06_06_202412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arms", force: :cascade do |t|
    t.string "name"
    t.float "experience_price", default: 0.0
    t.float "additional_power_percent", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.float "current_life", default: 100.0
    t.float "max_life", default: 100.0
    t.float "power", default: 2.0
    t.integer "level", default: 1
    t.float "current_experience", default: 0.0
    t.float "max_experience", default: 100.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fightings", force: :cascade do |t|
    t.bigint "fighter_one_id"
    t.bigint "fighter_two_id"
    t.string "winner"
    t.float "winner_gained_experience", default: 0.0
    t.boolean "winner_leveled_up", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fighter_one_id"], name: "index_fightings_on_fighter_one_id"
    t.index ["fighter_two_id"], name: "index_fightings_on_fighter_two_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.float "experience_price", default: 0.0
    t.float "additional_power", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fightings", "characters", column: "fighter_one_id"
  add_foreign_key "fightings", "characters", column: "fighter_two_id"
end
