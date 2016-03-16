require 'test_helper'

class PatientCareScoresControllerTest < ActionController::TestCase
  include PatientCareScoresHelper

  setup do
    @patient_care_score = patient_care_scores(:one)
  end

  test "find zipcode near my home" do
    zips = zip_codes_nearby(20170, 2)
    puts zips
    assert_equal 7, zips.length
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_care_scores)
  end

  test "should search hospitals and filter them properly" do
    #Charlottesville, VA
    post :create, q: 'Charlottesville, VA'
    assert_response :success
  end


  test "should show patient_care_score" do
    get :show, id: @patient_care_score
    assert_response :success
  end

  test "should get cities for valid input" do
    get :cities, term: 'ton'
    puts response.body
    assert_match /Boston/, response.body
  end

  test "should get return emtpy json for invalid cities input" do
    get :cities, term: ''
    puts response.body
    assert_equal '[]', response.body
  end


end
