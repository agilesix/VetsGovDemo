class CreatePatientCareScores < ActiveRecord::Migration
  def change
    create_table :patient_care_scores do |t|
      t.integer :provider_number
      t.string :hospital_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :county_name
      t.integer :communication_with_nurses_achievement_points
      t.integer :communication_with_nurses_improvement_points
      t.integer :communication_with_nurses_dimension_score
      t.integer :communication_with_doctors_achievement_points
      t.integer :communication_with_doctors_improvement_points
      t.integer :communication_with_doctors_dimension_score
      t.integer :responsiveness_of_hospital_staff_achievement_points
      t.integer :responsiveness_of_hospital_staff_improvement_points
      t.integer :responsiveness_of_hospital_staff_dimension_score
      t.integer :pain_management_achievement_points
      t.integer :pain_management_improvement_points
      t.integer :pain_management_dimension_score
      t.integer :communication_about_medicines_achievement_points
      t.integer :communication_about_medicines_improvement_points
      t.integer :communication_about_medicines_dimension_score
      t.integer :hospital_environment_achievement_points
      t.integer :hospital_environment_improvement_points
      t.integer :hospital_environment_dimension_score
      t.integer :discharge_information_achievement_points
      t.integer :discharge_information_improvement_points
      t.integer :discharge_information_dimension_score
      t.integer :overall_hospital_achievement_points
      t.integer :overall_hospital_improvement_points
      t.integer :overall_hospital_dimension_score
      t.integer :hcahps_base_score
      t.integer :hcahps_consistency_score
      t.string :location

      t.timestamps null: false
    end
    add_index :patient_care_scores, :provider_number, unique: true
    add_index :patient_care_scores, :hospital_name
    add_index :patient_care_scores, :city
    add_index :patient_care_scores, :state
    add_index :patient_care_scores, :hcahps_base_score
    add_index :patient_care_scores, :hcahps_consistency_score
  end
end
