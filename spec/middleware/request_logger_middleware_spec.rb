require 'rails_helper'

RSpec.describe RequestLoggerMiddleware do
  let(:app) { ->(env) { [200, env, "response"] } }
  let(:middleware) { RequestLoggerMiddleware.new(app) }

  it 'логує запит' do
    env = Rack::MockRequest.env_for("/test?param=value", method: "GET")

    expect(Rails.logger).to receive(:info).with(/\[Request\] GET \/test/)

    middleware.call(env)
  end
end
