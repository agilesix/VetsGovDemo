class PatientCareScoresController < ApplicationController
  before_action :set_patient_care_score, only: [:show, :edit, :update, :destroy]

  # GET /patient_care_scores
  # GET /patient_care_scores.json
  def index
    @patient_care_scores = []
  end

  #GET /patient_care_scores/cities
  #GET /patient_care_scores/cities.json
  def cities
    logger.info "Searching Cities with term = #{params[:term]}"
    places = []
    q = params[:term]
    if !q.blank? then
      list = Place.where ("lower(city) like '%#{q.downcase}%'")
      list.each do |item|
        value = "#{item.city}, #{item.state}"
        place = Hash.new
        place[:label] = value
        place[:value] = value
        places.append place
      end
      logger.info "Found #{places.length} cities"
    end
    render json: places
  end

  # GET /patient_care_scores/1
  # GET /patient_care_scores/1.json
  def show
    do_grading(@patient_care_score)
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
    logger.info "Searching hospitals near: #{params[:q]}"
    city_and_state = params[:q]
    city = city_and_state.split(',')[0].strip
    state = city_and_state.split(',')[1].strip
    logger.info "  The city :#{city} and the state: #{state}"

    hospital = PatientCareScore.find_by_city_and_state(city, state)
    hospital.distance = 0
    logger.info "  Found the hospital [id: #{hospital.id}, zip_code:#{hospital.zip_code}, city:#{hospital.city}, state:#{hospital.state}, name:#{hospital.hospital_name}]"
    the_zip_code = hospital.zip_code
    nearby_zips = view_context.zip_codes_nearby(the_zip_code)

    nearby_zips.delete(the_zip_code)

    hospitals = PatientCareScore.where(zip_code: nearby_zips.keys).sort_by { |h| nearby_zips.keys.index(h.zip_code) }
    hospitals.each_with_index do |h, index|
      h.distance = nearby_zips[h.zip_code]
      logger.info " Found -  #{index}) [id: #{h.id}, zip_code:#{h.zip_code}, city:#{h.city}, state:#{h.state}, name:#{h.hospital_name}, distance:#{h.distance}] "
    end
    first_five_hospitals = hospitals.slice(0, 5)
    first_five_hospitals.each_with_index do |h, index|
      logger.info " Choose - #{index}) [id: #{h.id}, zip_code:#{h.zip_code}, city:#{h.city}, state:#{h.state}, name:#{h.hospital_name}, distance:#{h.distance}] "
    end
    final_hospitals_list = [hospital] + first_five_hospitals
    final_hospitals_list.each_with_index do |h, index|
      do_grading(h)
      logger.info " Final - #{index}) [id: #{h.id}, zip_code:#{h.zip_code}, city:#{h.city}, state:#{h.state}, name:#{h.hospital_name}, distance:#{h.distance}] "
    end
    @patient_care_scores = final_hospitals_list
    @patient_care_score = hospital
    render :list
  end

  def do_grading(h)
    h.grade = 'Poor'
    h.score = h.total_performance_score.floor
    if h.score > 30 then
      h.grade = 'Fair'
    end
    if h.score > 70 then
      h.grade = 'Good'
    end
    if h.score > 90 then
      h.grade = 'Excellent'
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
end
