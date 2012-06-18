require "bubz/engine"
require "bubz/stubbed_request"
require "bubz/middleware"

module Bubz

  @stubs = []

  def self.stub_for_env(env)
    request_uri = env['REQUEST_URI'] || env['ORIGINAL_FULLPATH']
    @stubs.detect{|stub| stub.stubs_uri?(request_uri)}
  end

  def self.stub_request(uri_pattern, response_body)
    @stubs << StubbedRequest.new(uri_pattern, response_body)
  end

end
