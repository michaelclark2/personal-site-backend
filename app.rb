require 'sinatra'
require 'sinatra/activerecord'
require 'json'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class App < Sinatra::Base


  get '/blogs' do
    Blog.all.to_json
  end

  get '/projects' do
    Project.all.to_json
  end

  get '/' do
    routes = []
    self.class.routes["GET"].each do |route|
      routes.push route[0].to_s
    end
    routes.to_json
  end

end
