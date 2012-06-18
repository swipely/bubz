module Bubz

  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      if stub = Bubz.stub_for_env(env)
        stub.rack_response
      else
        @app.call(env)
      end
    end
    protected :_call
  end

end
