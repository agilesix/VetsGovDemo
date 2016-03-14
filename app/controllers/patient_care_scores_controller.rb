class PatientCareScoresController < ApplicationController
  before_action :set_patient_care_score, only: [:show, :edit, :update, :destroy]

  # GET /patient_care_scores
  # GET /patient_care_scores.json
  def index
    @patient_care_scores = PatientCareScore.all
  end

  # GET /patient_care_scores/1
  # GET /patient_care_scores/1.json
  def show
  end

  # GET /patient_care_scores/new
  def new
    @patient_care_score = PatientCareScore.new
  end

  # GET /patient_care_scores/1/edit
  def edit
  end

  # POST /patient_care_scores
  # POST /patient_care_scores.json
  def create
    @patient_care_score = PatientCareScore.new(patient_care_score_params)

    respond_to do |format|
      if @patient_care_score.save
        format.html { redirect_to @patient_care_score, notice: 'Patient care score was successfully created.' }
        format.json { render :show, status: :created, location: @patient_care_score }
      else
        format.html { render :new }
        format.json { render json: @patient_care_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_care_scores/1
  # PATCH/PUT /patient_care_scores/1.json
  def update
    respond_to do |format|
      if @patient_care_score.update(patient_care_score_params)
        format.html { redirect_to @patient_care_score, notice: 'Patient care score was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_care_score }
      else
        format.html { render :edit }
        format.json { render json: @patient_care_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_care_scores/1
  # DELETE /patient_care_scores/1.json
  def destroy
    @patient_care_score.destroy
    respond_to do |format|
      format.html { redirect_to patient_care_scores_url, notice: 'Patient care score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_care_score
      @patient_care_score = PatientCareScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_care_score_params
      params.require(:patient_care_score).permit(:provider_number, :hospital_name, :address, :city, :state, :zip_code, :county_name, :communication_with_nurses_achievement_points, :communication_with_nurses_improvement_points, :communication_with_nurses_dimension_score, :communication_with_doctors_achievement_points, :communication_with_doctors_improvement_points, :communication_with_doctors_dimension_score, :responsiveness_of_hospital_staff_achievement_points, :responsiveness_of_hospital_staff_improvement_points, :responsiveness_of_hospital_staff_dimension_score, :pain_management_achievement_points, :pain_management_improvement_points, :pain_management_dimension_score, :communication_about_medicines_achievement_points, :communication_about_medicines_improvement_points, :communication_about_medicines_dimension_score, :hospital_environment_achievement_points, :hospital_environment_improvement_points, :hospital_environment_dimension_score, :discharge_information_achievement_points, :discharge_information_improvement_points, :discharge_information_dimension_score, :overall_hospital_achievement_points, :overall_hospital_improvement_points, :overall_hospital_dimension_score, :hcahps_base_score, :hcahps_consistency_score, :location)
    end
end
