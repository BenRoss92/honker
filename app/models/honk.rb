class Honk
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :posted_at, Time

  belongs_to :user, :required => false
end
