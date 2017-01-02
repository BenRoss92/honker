require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  has n, :honks
end
