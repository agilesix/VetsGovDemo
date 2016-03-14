require 'net/http'
require 'csv-mapper'
namespace :etl do
  desc "Data loading for Hospital Value Based Purchansing - Patient Care Domain Scores"
  task :load_hcahps => [:environment] do
    cacert = Rails.root.join('config', 'cacert.pem').to_s
    ENV['SSL_CERT_FILE'] = cacert

    # 1 Get the file from https://data.medicare.gov/api/views/avtz-f2ge/rows.csv?accessType=DOWNLOAD
    uri = URI('https://data.medicare.gov/api/views/avtz-f2ge/rows.csv?accessType=DOWNLOAD')
    downloaded_file = Net::HTTP.get(uri)

    puts "Download data file\n"
    # 2 Store file in tmp folder
    File.open(Rails.root.join('tmp', 'hcaphps.csv'), 'w') do |file|
      file.write(downloaded_file)
    end

    # Use CSV Mapper and load it.
    results = CsvMapper.import(Rails.root.join('tmp', 'hcaphps.csv').to_s) do
      read_attributes_from_file
    end
    puts "Mapped data file\n"
    results.each do |rec|
      puts "processing #{rec.provider_number}"
      o = PatientCareScore.new(:hospital_name => rec.hospital_name)
      o.provider_number = rec.provider_number
      o.address = rec.address
      o.city = rec.city
      o.state = rec.state
      o.zip_code = rec.zip_code
      o.county_name = rec.county_name
      o.communication_with_nurses_achievement_points = transform_score(rec.communication_with_nurses_achievement_points)
      o.communication_with_nurses_improvement_points = transform_score(rec.communication_with_nurses_improvement_points)
      o.communication_with_nurses_dimension_score = transform_score(rec.communication_with_nurses_dimension_score)
      o.communication_with_doctors_achievement_points = transform_score(rec.communication_with_doctors_achievement_points)
      o.communication_with_doctors_improvement_points = transform_score(rec.communication_with_doctors_improvement_points)
      o.communication_with_doctors_dimension_score = transform_score(rec.communication_with_doctors_dimension_score)
      o.responsiveness_of_hospital_staff_achievement_points = transform_score(rec.responsiveness_of_hospital_staff_achievement_points)
      o.responsiveness_of_hospital_staff_improvement_points = transform_score(rec.responsiveness_of_hospital_staff_improvement_points)
      o.responsiveness_of_hospital_staff_dimension_score = transform_score(rec.responsiveness_of_hospital_staff_dimension_score)
      o.pain_management_achievement_points = transform_score(rec.pain_management_achievement_points)
      o.pain_management_improvement_points = transform_score(rec.pain_management_improvement_points)
      o.pain_management_dimension_score = transform_score(rec.pain_management_dimension_score)
      o.communication_about_medicines_achievement_points = transform_score(rec.communication_about_medicines_achievement_points)
      o.communication_about_medicines_improvement_points = transform_score(rec.communication_about_medicines_improvement_points)
      o.communication_about_medicines_dimension_score = transform_score(rec.communication_about_medicines_dimension_score)
      o.hospital_environment_achievement_points = transform_score(rec.cleanliness_and_quietness_of_hospital_environment_achievement_points)
      o.hospital_environment_improvement_points = transform_score(rec.cleanliness_and_quietness_of_hospital_environment_improvement_points)
      o.hospital_environment_dimension_score = transform_score(rec.cleanliness_and_quietness_of_hospital_environment_dimension_score)
      o.discharge_information_achievement_points = transform_score(rec.discharge_information_achievement_points)
      o.discharge_information_improvement_points = transform_score(rec.discharge_information_improvement_points)
      o.discharge_information_dimension_score = transform_score(rec.discharge_information_dimension_score)
      o.overall_hospital_achievement_points = transform_score(rec.overall_rating_of_hospital_achievement_points)
      o.overall_hospital_improvement_points = transform_score(rec.overall_rating_of_hospital_improvement_points)
      o.overall_hospital_dimension_score = transform_score(rec.overall_rating_of_hospital_dimension_score)
      o.hcahps_base_score = transform_score(rec.hcahps_base_score)
      o.hcahps_consistency_score = transform_score(rec.hcahps_consistency_score)
      o.location = transform_score(rec.location)
      o.save()
    end
    puts "Data load finished successfully"
  end

  def transform_score(score)
    if (score.equal? 'Not Available')
      return 0
    end
    return score.split(' ')[0]
  end
end