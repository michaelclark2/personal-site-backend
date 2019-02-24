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

ActiveRecord::Schema.define(version: 2019_02_23_191928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.string "github"
    t.string "url"
    t.string "thumbnail"
  end

  create_table "projecttechnos", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "techno_id"
    t.index ["project_id"], name: "index_projecttechnos_on_project_id"
    t.index ["techno_id"], name: "index_projecttechnos_on_techno_id"
  end

  create_table "technos", force: :cascade do |t|
    t.string "name"
  end

end
