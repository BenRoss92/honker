require 'dm-postgres-adapter'
require 'data_mapper'

class Honk
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :posted_at, Time
end

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://localhost/honker_test')
DataMapper.finalize
DataMapper.auto_upgrade!
