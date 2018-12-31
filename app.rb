require 'sinatra'
require 'sinatra/activerecord'
require 'json'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class App < Sinatra::Base


  get '/blogs' do
    Blog.all.to_json
  end

  post '/blogs' do
    Blog.create JSON.parse(request.body.read)
  end

  get '/blog/:id' do
    Blog.find(params[:id]).to_json
  end

  put '/blog/:id' do
    Blog.update params[:id], JSON.parse(request.body.read)
  end

  delete '/blog/:id' do
    Blog.destroy(params[:id])
  end

  get '/projects' do
    Project.all.to_json
  end

  post '/projects' do
    Project.create JSON.parse(request.body.read)
  end

  get '/project/:id' do
    Project.find(params[:id]).to_json
  end

  put '/project/:id' do
    Project.update params[:id], JSON.parse(request.body.read)
  end

  delete '/project/:id' do
    Project.destroy(params[:id])
  end

  get '/' do
    routes = []
    self.class.routes["GET"].each do |route|
      routes.push route[0].to_s
    end
    routes.to_json
  end

end
