require 'spec_helper'

describe Bubz do

  context "with a stubbed request" do

    let(:uri_pattern) { stub(:uri_pattern) }
    let(:response_body) { stub(:response_body) }
    let(:env) { stub(:env).as_null_object }

    before do
      Bubz.stub_request(uri_pattern, response_body)
    end

    it "matches stubbed requests" do
      Bubz::StubbedRequest.any_instance.stub(:stubs_uri?).and_return(true)

      response = Bubz.stub_for_env(env).rack_response

      response.last.should == [response_body.to_s]
    end

    it "passes on non-stubbed requests" do
      Bubz::StubbedRequest.any_instance.stub(:stubs_uri?).and_return(false)

      Bubz.stub_for_env(env).should be_nil
    end

  end

end
