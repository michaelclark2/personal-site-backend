require 'sinatra'
require 'json'


class App < Sinatra::Base


  get '/aye' do
    'Aye lmao'
  end

  get '/' do
    routes = []
    self.class.routes["GET"].each do |route|
      routes.push route[0].to_s
    end
    routes.to_json
  end

end
