require 'spec_helper'

describe Bubz::StubbedRequest do

  let(:response_body) { "I like stubbing web requests!" }
  let(:uri_pattern) { "/ninja_turtles/.*/partytime" }

  subject { Bubz::StubbedRequest.new(uri_pattern, response_body) }

  it "builds a Rack response object" do
    subject.rack_response.should == [200, {}, [response_body]]
  end

  it "matches request URIs against its pattern" do
    subject.stubs_uri?("http://foo.com/ninja_turtles/michaelangelo/partytime.json").should be_true
    subject.stubs_uri?("http://foo.com/bad_guys/shredder/partytime.json").should be_false
  end

end
