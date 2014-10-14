require 'dm-timestamps'

class Post

  include DataMapper::Resource 

  property :id,         Serial
  property :content,    String
  property :created_at, DateTime

  belongs_to :user
  has n, :replies

end
