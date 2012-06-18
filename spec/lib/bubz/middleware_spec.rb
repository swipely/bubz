require 'spec_helper'

describe Bubz::Middleware do

  let(:rack_response) { stub(:rack_response) }
  let(:env) { stub(:env) }
  let(:app) { stub(:app) }

  subject { Bubz::Middleware.new(app) }

  it "returns a stubbed response for stubbed requests" do
    stubbed_request = stub(:stubbed_request, rack_response: rack_response)

    Bubz.stub(:stub_for_env).with(env).and_return(stubbed_request)

    subject.call(env).should == rack_response
  end

  it "passes the request through if not stubbed" do
    Bubz.stub(:stub_for_env).and_return(nil)

    app.stub(:call).with(env).and_return(rack_response)

    subject.call(env).should == rack_response
  end

end

