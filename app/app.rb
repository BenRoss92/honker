ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'models/honk'

class Honker < Sinatra::Base

  get '/honks' do
    @honks = Honk.all
    erb :'honks/index'
  end

  get '/honks/new' do
    erb :'honks/new'
  end

  post '/honks' do
    Honk.create(message: params[:message], posted_at: Time.new)
    redirect('/honks')
  end

  run! if app_file == $0
end
