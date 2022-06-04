# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < Minitest::Test
  # rubocop:disable Style/StringConcatenation
  DEFAULT_RESPONSE_DIR = Dir.pwd + "/test/features/support/default_response.xml"
  VALID_RESPONSE_DIR = Dir.pwd + "/test/features/support/valid_response.xml"
  # rubocop:enable Style/StringConcatenation
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_lookup
    valid_response = File.open(VALID_RESPONSE_DIR, &:read)
    stub_request(:get, "http://ip-api.com/xml/8.8.8.8").to_return({ body: valid_response })

    ip_meta = Ipgeobase.lookup("8.8.8.8")
    assert(ip_meta.city == "Ashburn")
    assert(ip_meta.country == "United States")
    assert(ip_meta.countryCode == "US")
    assert(ip_meta.lat == "39.03")
    assert(ip_meta.lon == "-77.5")
  end

  def test_lookup_with_empty_ip
    default_response = File.open(DEFAULT_RESPONSE_DIR, &:read)
    stub_request(:get, "http://ip-api.com/xml/").to_return({ body: default_response })

    ip_meta = Ipgeobase.lookup("")
    assert(ip_meta.city == "Moscow")
    assert(ip_meta.country == "Russia")
    assert(ip_meta.countryCode == "Ru")
    assert(ip_meta.lat == "55.7483")
    assert(ip_meta.lon == "37.6171")
  end

  def test_lookup_with_nil
    default_response = File.open(DEFAULT_RESPONSE_DIR, &:read)
    stub_request(:get, "http://ip-api.com/xml/").to_return({ body: default_response })

    ip_meta = Ipgeobase.lookup(nil)
    assert(ip_meta.city == "Moscow")
    assert(ip_meta.country == "Russia")
    assert(ip_meta.countryCode == "Ru")
    assert(ip_meta.lat == "55.7483")
    assert(ip_meta.lon == "37.6171")
  end
end
