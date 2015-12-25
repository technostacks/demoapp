# Bundler
require "rubygems"
require "bundler/setup"
require 'sinatra/reloader'

# Sinatra
require "sinatra"

# The app
class Testing < Sinatra::Base
  register Sinatra::Reloader
  get "/" do
    "Hello, all !"
  end
end

