require 'httparty'
module PatientCareScoresHelper

  ZIPCODE_API_URL = 'https://www.zipcodeapi.com/rest'
  API_KEYS = ['kOxh1vH4WT5jHZkdCaTCNrIaDoSy5oIqcgHdLoiIin10nleZw7BkzkudJmMOLufX',
              '98mghGehgrKcgP6UfEyJKzMWSyAx2VBb4XslEGDV7n7odeisSRcDrYzjxaRz6sKa']
  RADIUS = 50


  #
  # The free api key has 1 minute 1 request restriction, so we iterate X times in search of zip codes
  #
  def zip_codes_nearby (a_zipcode, radius = RADIUS)
    nearby_zips = {}
    API_KEYS.each do |api_key|

      url = "#{ZIPCODE_API_URL}/#{api_key}/radius.json/#{a_zipcode}/#{radius}/mile"
      zipcode_info = find_zips(url)
      if zipcode_info then
        zipcode_info['zip_codes'].each do |zip|
          the_zip_code = zip['zip_code'].to_i
          nearby_zips[the_zip_code] = zip['distance']
        end
        return nearby_zips.sort_by { |key, value| value }
      end
    end
    return nearby_zips.sort_by { |key, value| value }
  end

  def find_zips(url)
    Rails.logger.info "Requesting zipcodes from URL :#{url}"
    zipcode_response = HTTParty.get(url)
    Rails.logger.info "Response from zipcodeapi.com : #{zipcode_response.body}"
    if zipcode_response.code == 200
      zipcode_info = JSON.parse(zipcode_response.body)
    else
      zipcode_info = nil
    end
  end

end
