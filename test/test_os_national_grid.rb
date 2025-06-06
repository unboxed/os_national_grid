# frozen_string_literal: true

require "test_helper"

class TestOsNationalGrid < Minitest::Test
  def setup
    @easting = 481_987.066
    @northing = 213_552.27
    @longitude = -0.812036
    @latitude = 51.814605
  end

  def test_os_ng_to_wgs84
    lng, lat = OsNationalGrid.os_ng_to_wgs84(@easting, @northing)

    assert_in_delta @longitude, lng, 0.002, "Longitude not within tolerance"
    assert_in_delta @latitude, lat, 0.002, "Latitude not within tolerance"
  end

  def test_wgs84_to_os_ng
    easting, northing = OsNationalGrid.wgs84_to_os_ng(@longitude, @latitude)

    assert_in_delta @easting, easting, 2.0, "Easting not within tolerance"
    assert_in_delta @northing, northing, 2.0, "Northing not within tolerance"
  end
end
