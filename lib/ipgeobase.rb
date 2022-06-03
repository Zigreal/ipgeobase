# frozen_string_literal: true

require_relative "ipgeobase/version"
require "net/http"

# Allows to return metadata attributes
module Ipgeobase
  autoload :MetadataBuilder, "ipgeobase/metadata_builder"
  class << self
    def lookup(ip)
      response = Net::HTTP.get(URI("http://ip-api.com/xml/#{ip if ip&.size&.positive?}"))
      MetadataBuilder.parse(response)
    end
  end
end
