require 'dm-timestamps'

class Reply

  include DataMapper::Resource 

  property :id,       Serial
  property :reply_content,  String
  property :created_at,   DateTime
  property :username,   String
  property :realname,   String
  property :user_id,  Integer
  property :post_id,  Integer 

  belongs_to :post

end
