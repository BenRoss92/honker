require 'dm-postgres-adapter'
require 'data_mapper'

class Honk
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :posted_at, Time
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/honker_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
