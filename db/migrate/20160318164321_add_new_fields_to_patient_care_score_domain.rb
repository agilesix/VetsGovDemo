class AddNewFieldsToPatientCareScoreDomain < ActiveRecord::Migration
  def change
    add_column :patient_care_scores, :provider_number, :integer
    add_index :patient_care_scores, :provider_number
    add_column :patient_care_scores, :hospital_name, :string
    add_column :patient_care_scores, :address, :string
    add_column :patient_care_scores, :city, :string
    add_index :patient_care_scores, :city
    add_column :patient_care_scores, :state, :string
    add_index :patient_care_scores, :state
    add_column :patient_care_scores, :zip_code, :integer
    add_index :patient_care_scores, :zip_code
    add_column :patient_care_scores, :county_name, :string
    add_column :patient_care_scores, :unweighted_patient_care_score, :float
    add_column :patient_care_scores, :weighted_patient_care_score, :float
    add_column :patient_care_scores, :unweighted_patient_experience_score, :float
    add_column :patient_care_scores, :weighted_patient_experience_score, :float
    add_column :patient_care_scores, :unweighted_outcome_score, :float
    add_column :patient_care_scores, :weighted_outcome_score, :float
    add_column :patient_care_scores, :unweighted_efficiency_score, :float
    add_column :patient_care_scores, :weighted_efficiency_score, :float
    add_column :patient_care_scores, :total_performance_score, :float
    add_column :patient_care_scores, :location, :string
  end
end
