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

ActiveRecord::Schema.define(version: 20160315172408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "message",    null: false
    t.date     "sent_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "patient_care_scores", force: :cascade do |t|
    t.integer  "provider_number"
    t.string   "hospital_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "county_name"
    t.integer  "communication_with_nurses_achievement_points"
    t.integer  "communication_with_nurses_improvement_points"
    t.integer  "communication_with_nurses_dimension_score"
    t.integer  "communication_with_doctors_achievement_points"
    t.integer  "communication_with_doctors_improvement_points"
    t.integer  "communication_with_doctors_dimension_score"
    t.integer  "responsiveness_of_hospital_staff_achievement_points"
    t.integer  "responsiveness_of_hospital_staff_improvement_points"
    t.integer  "responsiveness_of_hospital_staff_dimension_score"
    t.integer  "pain_management_achievement_points"
    t.integer  "pain_management_improvement_points"
    t.integer  "pain_management_dimension_score"
    t.integer  "communication_about_medicines_achievement_points"
    t.integer  "communication_about_medicines_improvement_points"
    t.integer  "communication_about_medicines_dimension_score"
    t.integer  "hospital_environment_achievement_points"
    t.integer  "hospital_environment_improvement_points"
    t.integer  "hospital_environment_dimension_score"
    t.integer  "discharge_information_achievement_points"
    t.integer  "discharge_information_improvement_points"
    t.integer  "discharge_information_dimension_score"
    t.integer  "overall_hospital_achievement_points"
    t.integer  "overall_hospital_improvement_points"
    t.integer  "overall_hospital_dimension_score"
    t.integer  "hcahps_base_score"
    t.integer  "hcahps_consistency_score"
    t.string   "location"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "patient_care_scores", ["city"], name: "index_patient_care_scores_on_city", using: :btree
  add_index "patient_care_scores", ["hcahps_base_score"], name: "index_patient_care_scores_on_hcahps_base_score", using: :btree
  add_index "patient_care_scores", ["hcahps_consistency_score"], name: "index_patient_care_scores_on_hcahps_consistency_score", using: :btree
  add_index "patient_care_scores", ["hospital_name"], name: "index_patient_care_scores_on_hospital_name", using: :btree
  add_index "patient_care_scores", ["provider_number"], name: "index_patient_care_scores_on_provider_number", unique: true, using: :btree
  add_index "patient_care_scores", ["state"], name: "index_patient_care_scores_on_state", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "places", ["city"], name: "index_places_on_city", using: :btree
  add_index "places", ["state"], name: "index_places_on_state", using: :btree
  add_index "places", ["zip"], name: "index_places_on_zip", using: :btree

end
