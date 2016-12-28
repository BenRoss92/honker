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
    @honks = Honk.all
    erb :'honks/index'
  end

  get '/honks/new' do
    if current_user
      erb :'honks/new'
    else
      redirect('/users/sign_up')
    end
  end

  post '/honks' do
    user = User.first(id: session[:user_id])
    honk = Honk.new(message: params[:message], posted_at: Time.now,
    user_id: user.id)
    honk.save
    redirect('/honks')
  end

  get '/users/sign_up' do
    erb :'users/sign_up'
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username],
     email: params[:email], password: params[:password],
     password_confirmation: params[:password_confirmation])
     session[:user_id] = user.id
    redirect('/honks')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
