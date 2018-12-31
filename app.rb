require 'sinatra'
require 'json'

class App < Sinatra::Base
  get '/' do
    'Hello, world!'
  end
end