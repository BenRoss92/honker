class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, String
  property :password_confirmation, String

  has n, :honks
end