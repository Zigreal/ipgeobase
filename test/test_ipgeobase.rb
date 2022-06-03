# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_lookup
    stub_request(:get, "http://ip-api.com/xml/8.8.8.8").to_return({ body: VALID_RESPONSE })

    ip_meta = Ipgeobase.lookup("8.8.8.8")
    assert(ip_meta.city == "Ashburn")
    assert(ip_meta.country == "United States")
    assert(ip_meta.countryCode == "US")
    assert(ip_meta.lat == "39.03")
    assert(ip_meta.lon == "-77.5")
  end

  def test_lookup_with_empty_ip
    stub_request(:get, "http://ip-api.com/xml/").to_return({ body: RESPONSE_FOR_EMPTY_IP })

    ip_meta = Ipgeobase.lookup("")
    assert(ip_meta.city == "Moscow")
    assert(ip_meta.country == "Russia")
    assert(ip_meta.countryCode == "Ru")
    assert(ip_meta.lat == "55.7483")
    assert(ip_meta.lon == "37.6171")
  end

  def test_lookup_with_nil
    stub_request(:get, "http://ip-api.com/xml/").to_return({ body: RESPONSE_FOR_EMPTY_IP })

    ip_meta = Ipgeobase.lookup(nil)
    assert(ip_meta.city == "Moscow")
    assert(ip_meta.country == "Russia")
    assert(ip_meta.countryCode == "Ru")
    assert(ip_meta.lat == "55.7483")
    assert(ip_meta.lon == "37.6171")
  end
end
