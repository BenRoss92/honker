require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  # include BCrypt

  # attr_accessor :password, :password_confirmation

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
  # property :password, String
  # property :password_confirmation, String

  # validates_presence_of :password, :password_confirmation, :if => :password_required?
  # validates_confirmation_of :password, :if => :password_required?
  #
  # before :valid?, :crypt_password

  has n, :honks
end
