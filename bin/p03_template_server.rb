require 'rack'
require_relative '../lib/controller_base'

class MyController < ControllerBase
  def go
    render :show
  end
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new


  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
