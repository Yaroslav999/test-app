class RequestLoggerMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)

    Rails.logger.info "[Request] #{request.request_method} #{request.path} | Parameters: #{request.params.except('controller', 'action')}"

    @app.call(env)
  end
end
