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

ActiveRecord::Schema.define(version: 20160318164321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "email", null: false
    t.string "message", null: false
    t.date "sent_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
  end

  create_table "patient_care_scores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "provider_number"
    t.string "hospital_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "county_name"
    t.float "unweighted_patient_care_score"
    t.float "weighted_patient_care_score"
    t.float "unweighted_patient_experience_score"
    t.float "weighted_patient_experience_score"
    t.float "unweighted_outcome_score"
    t.float "weighted_outcome_score"
    t.float "unweighted_efficiency_score"
    t.float "weighted_efficiency_score"
    t.float "total_performance_score"
    t.string "location"
  end

  add_index "patient_care_scores", ["city"], name: "index_patient_care_scores_on_city", using: :btree
  add_index "patient_care_scores", ["provider_number"], name: "index_patient_care_scores_on_provider_number", using: :btree
  add_index "patient_care_scores", ["state"], name: "index_patient_care_scores_on_state", using: :btree
  add_index "patient_care_scores", ["zip_code"], name: "index_patient_care_scores_on_zip_code", using: :btree

  create_table "places", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "places", ["city"], name: "index_places_on_city", using: :btree
  add_index "places", ["state"], name: "index_places_on_state", using: :btree
  add_index "places", ["zip"], name: "index_places_on_zip", using: :btree

end
