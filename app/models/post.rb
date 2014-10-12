require 'dm-timestamps'

class Post

  include DataMapper::Resource 

  property :id,         Serial
  property :content,    String
  property :created_at, DateTime
  property :username,   String
  property :realname,   String

  has 1, :user, :through => Resource

end
