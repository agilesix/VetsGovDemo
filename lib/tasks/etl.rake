require 'net/http'
require 'csv-mapper'
namespace :etl do
  desc "Data loading for Hospital Value Based Purchansing - Patient Care Domain Scores"
  task :load_hcahps => [:environment] do
    cacert = Rails.root.join('config', 'cacert.pem').to_s
    ENV['SSL_CERT_FILE'] = cacert

    # 1 Get the file from https://data.medicare.gov/api/views/avtz-f2ge/rows.csv?accessType=DOWNLOAD
    uri = URI('https://data.medicare.gov/api/views/ypbt-wvdk/rows.csv?accessType=DOWNLOAD')
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
    places = Hash.new

    results.each do |rec|
      puts "processing #{rec.provider_number}"
      o = PatientCareScore.new(:hospital_name => rec.hospital_name)
      o.provider_number = rec.provider_number
      o.address = rec.address
      o.city = rec.city
      o.state = rec.state
      o.zip_code = rec.zip_code
      o.county_name = rec.county_name

      o.unweighted_patient_care_score = transform_score(rec.unweighted_normalized_clinical_process_of_care_domain_score)
      o.weighted_patient_care_score = transform_score(rec.weighted_clinical_process_of_care_domain_score)

      o.unweighted_patient_experience_score = transform_score(rec.unweighted_patient_experience_of_care_domain_score)
      o.weighted_patient_experience_score = transform_score(rec.weighted_patient_experience_of_care_domain_score)

      o.unweighted_outcome_score = transform_score(rec.unweighted_normalized_outcome_domain_score)
      o.weighted_outcome_score = transform_score(rec.weighted_outcome_domain_score)
      o.unweighted_efficiency_score = transform_score(rec.unweighted_normalized_efficiency_domain_score)

      o.weighted_efficiency_score = transform_score(rec.weighted_efficiency_domain_score)
      o.total_performance_score = transform_score(rec.total_performance_score)
      o.location = transform_score(rec.location)
      places["#{o.city},#{o.state}"] = Place.new(:city => o.city, :state => o.state, :zip => o.zip_code)
      o.save()
    end
    places.each do |key, place|
      place.save()
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