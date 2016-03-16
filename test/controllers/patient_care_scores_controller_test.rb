require 'test_helper'

class PatientCareScoresControllerTest < ActionController::TestCase
  setup do
    @patient_care_score = patient_care_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_care_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show patient_care_score" do
    get :show, id: @patient_care_score
    assert_response :success
  end

  test "should get cities for valid input" do
    get :cities, q: 'ton'
    puts response.body
    assert_match /Boston/, response.body
  end

  test "should get return emtpy json for invalid cities input" do
    get :cities, q: ''
    puts response.body
    assert_equal '[]', response.body
  end


  test "should get edit" do
    get :edit, id: @patient_care_score
    assert_response :success
  end

  test "should update patient_care_score" do
    patch :update, id: @patient_care_score, patient_care_score: { address: @patient_care_score.address, city: @patient_care_score.city, communication_about_medicines_achievement_points: @patient_care_score.communication_about_medicines_achievement_points, communication_about_medicines_dimension_score: @patient_care_score.communication_about_medicines_dimension_score, communication_about_medicines_improvement_points: @patient_care_score.communication_about_medicines_improvement_points, communication_with_doctors_achievement_points: @patient_care_score.communication_with_doctors_achievement_points, communication_with_doctors_dimension_score: @patient_care_score.communication_with_doctors_dimension_score, communication_with_doctors_improvement_points: @patient_care_score.communication_with_doctors_improvement_points, communication_with_nurses_achievement_points: @patient_care_score.communication_with_nurses_achievement_points, communication_with_nurses_dimension_score: @patient_care_score.communication_with_nurses_dimension_score, communication_with_nurses_improvement_points: @patient_care_score.communication_with_nurses_improvement_points, county_name: @patient_care_score.county_name, discharge_information_achievement_points: @patient_care_score.discharge_information_achievement_points, discharge_information_dimension_score: @patient_care_score.discharge_information_dimension_score, discharge_information_improvement_points: @patient_care_score.discharge_information_improvement_points, hcahps_base_score: @patient_care_score.hcahps_base_score, hcahps_consistency_score: @patient_care_score.hcahps_consistency_score, hospital_environment_achievement_points: @patient_care_score.hospital_environment_achievement_points, hospital_environment_dimension_score: @patient_care_score.hospital_environment_dimension_score, hospital_environment_improvement_points: @patient_care_score.hospital_environment_improvement_points, hospital_name: @patient_care_score.hospital_name, location: @patient_care_score.location, overall_hospital_achievement_points: @patient_care_score.overall_hospital_achievement_points, overall_hospital_dimension_score: @patient_care_score.overall_hospital_dimension_score, overall_hospital_improvement_points: @patient_care_score.overall_hospital_improvement_points, pain_management_achievement_points: @patient_care_score.pain_management_achievement_points, pain_management_dimension_score: @patient_care_score.pain_management_dimension_score, pain_management_improvement_points: @patient_care_score.pain_management_improvement_points, provider_number: @patient_care_score.provider_number, responsiveness_of_hospital_staff_achievement_points: @patient_care_score.responsiveness_of_hospital_staff_achievement_points, responsiveness_of_hospital_staff_dimension_score: @patient_care_score.responsiveness_of_hospital_staff_dimension_score, responsiveness_of_hospital_staff_improvement_points: @patient_care_score.responsiveness_of_hospital_staff_improvement_points, state: @patient_care_score.state, zip_code: @patient_care_score.zip_code }
    assert_redirected_to patient_care_score_path(assigns(:patient_care_score))
  end

  test "should destroy patient_care_score" do
    assert_difference('PatientCareScore.count', -1) do
      delete :destroy, id: @patient_care_score
    end

    assert_redirected_to patient_care_scores_path
  end
end