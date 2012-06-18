Given /^the backend stubs "(.*?)" with$/ do |uri_pattern, response_body|
  Bubz.stub_request(Regexp.new(uri_pattern), response_body)
end
