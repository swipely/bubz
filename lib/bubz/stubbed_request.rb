require 'cucumber'

module Bubz

  class StubbedRequest

    def initialize(uri_pattern, response_body)
      @uri_pattern = uri_pattern
      @response_body = response_body
    end

    def rack_response
      [200, {}, [@response_body.to_s]]
    end

    def stubs_uri?(uri)
      uri.match(@uri_pattern)
    end
  end

end
