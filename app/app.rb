ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Honker < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

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
    @user = User.new
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username],
     email: params[:email], password: params[:password],
     password_confirmation: params[:password_confirmation])
     if @user.save
      session[:user_id] = @user.id
      redirect('/honks')
     else
      flash.now[:error] = "Password and Password Confirmation don't match"
      erb :'users/sign_up'
     end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
