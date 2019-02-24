require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/cross_origin'
require 'json'
require 'sendgrid-ruby'
include SendGrid

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }


class App < Sinatra::Base

  set :bind, '0.0.0.0'
  configure do
    enable :cross_origin
  end
  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  post '/email' do
    email = JSON.parse(request.body.read)
    from = Email.new(email: email["email"])
    subject = email["name"] + ": " + email["subject"]
    to = Email.new(email: 'michael.clark1992@gmail.com')
    content = Content.new(type: 'text/plain', value: email["message"])
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end

  get '/blogs' do
    Blog.all.to_json
  end

  post '/blogs' do
    Blog.create request.params
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

  get '/new/blog' do
    erb :add_blog
  end

  get '/projects' do
    projects = Project.all
    projects.each do |p|
      p.techs = p.technos.pluck(:name)
    end
    projects.to_json
  end

  post '/projects' do
    p request.params
    # Project.create request.params
    redirect_to '/projects'
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

  get '/new/project' do
    @techs = Techno.all
    erb :add_project
  end

  get '/' do
    routes = []
    self.class.routes["GET"].each do |route|
      routes.push route[0].to_s
    end
    routes.to_json
  end

  options "*" do
    response.headers["Allow"] = "GET, POST, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end

end
