require 'sinatra/base'
require_relative 'models/honk'

class Honker < Sinatra::Base

  get '/honks' do
    @honks = Honk.all
    erb :'honks/index'
  end

  run! if app_file == $0
end
