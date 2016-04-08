class RemoveAllFieldsFromPatientCareScore < ActiveRecord::Migration
  def change
    remove_column :patient_care_scores, :provider_number, :integer
    remove_column :patient_care_scores, :hospital_name, :string
    remove_column :patient_care_scores, :address, :string
    remove_column :patient_care_scores, :city, :string
    remove_column :patient_care_scores, :state, :string
    remove_column :patient_care_scores, :zip_code, :integer
    remove_column :patient_care_scores, :county_name, :string
    remove_column :patient_care_scores, :communication_with_nurses_achievement_points, :integer
    remove_column :patient_care_scores, :communication_with_nurses_improvement_points, :integer
    remove_column :patient_care_scores, :communication_with_nurses_dimension_score, :integer
    remove_column :patient_care_scores, :communication_with_doctors_achievement_points, :integer
    remove_column :patient_care_scores, :communication_with_doctors_improvement_points, :integer
    remove_column :patient_care_scores, :communication_with_doctors_dimension_score, :integer
    remove_column :patient_care_scores, :responsiveness_of_hospital_staff_achievement_points, :integer
    remove_column :patient_care_scores, :responsiveness_of_hospital_staff_improvement_points, :integer
    remove_column :patient_care_scores, :responsiveness_of_hospital_staff_dimension_score, :integer
    remove_column :patient_care_scores, :pain_management_achievement_points, :integer
    remove_column :patient_care_scores, :pain_management_improvement_points, :integer
    remove_column :patient_care_scores, :pain_management_dimension_score, :integer
    remove_column :patient_care_scores, :communication_about_medicines_achievement_points, :integer
    remove_column :patient_care_scores, :communication_about_medicines_improvement_points, :integer
    remove_column :patient_care_scores, :communication_about_medicines_dimension_score, :integer
    remove_column :patient_care_scores, :hospital_environment_achievement_points, :integer
    remove_column :patient_care_scores, :hospital_environment_improvement_points, :integer
    remove_column :patient_care_scores, :hospital_environment_dimension_score, :integer
    remove_column :patient_care_scores, :discharge_information_achievement_points, :integer
    remove_column :patient_care_scores, :discharge_information_improvement_points, :integer
    remove_column :patient_care_scores, :discharge_information_dimension_score, :integer
    remove_column :patient_care_scores, :overall_hospital_achievement_points, :integer
    remove_column :patient_care_scores, :overall_hospital_improvement_points, :integer
    remove_column :patient_care_scores, :overall_hospital_dimension_score, :integer
    remove_column :patient_care_scores, :hcahps_base_score, :integer
    remove_column :patient_care_scores, :hcahps_consistency_score, :integer
    remove_column :patient_care_scores, :location, :string
  end
end
