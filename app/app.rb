ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Honker < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect('/honks')
  end

  get '/honks' do
    @username = session[:username]
    @honks = Honk.all
    erb :'honks/index'
  end

  get '/honks/new' do
    erb :'honks/new'
  end

  post '/honks' do
    Honk.new(message: params[:message], posted_at: Time.new)
    redirect('/honks')
  end

  get '/users/sign_up' do
    erb :'users/sign_up'
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username],
     email: params[:email], password: params[:password],
     password_confirmation: params[:password_confirmation])
    session[:username] = user.username
    redirect('/honks')
  end

  run! if app_file == $0
end
