# frozen_string_literal: true

require_relative "ipgeobase/version"
require "net/http"

# Allows to return metadata attributes
module Ipgeobase
  IP_API_ADDRESS = "http://ip-api.com/xml/"

  autoload :MetadataBuilder, "ipgeobase/metadata_builder"

  class << self
    def lookup(ip)
      response = Net::HTTP.get(URI("#{IP_API_ADDRESS}#{ip if ip&.size&.positive?}"))
      MetadataBuilder.parse(response)
    end
  end
end
