require 'test_helper'

class PlaceTest < ActiveSupport::TestCase

  test "test that places can be searched by city" do
    q = 'to'
    places = Place.where ("lower(city) like '%#{q}%'")
    assert_equal 2, places.length

    q = 'bost'.downcase
    places = Place.where ("lower(city) like '%#{q}%'")
    assert_equal 1, places.length
  end
end
