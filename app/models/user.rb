require 'bcrypt'
require 'dm-validations'

class User

  attr_reader :password 
  attr_accessor :password_confirmation 

  include DataMapper::Resource 

  property :id,         Serial
  property :username,   String, :unique => true
  property :realname,   String
  property :email,      String, :unique => true
  property :password_digest,  Text

  validates_confirmation_of :password 
  validates_uniqueness_of :email 


  def password=(password)
    @password = password 
    self.password_digest = BCrypt::Password.create(password)
  end

  # def self.authenticate(email, password)
  #   user = first(:email => email)
  #   if user && BCrypt::Password.new(user.password_digest) == password 
  #     user
  #   else
  #     nil
  #   end
  # end


end