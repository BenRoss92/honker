require 'dm-postgres-adapter'
require 'data_mapper'

require_relative 'models/honk'
require_relative 'models/user'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/honker_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
