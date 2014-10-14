require 'dm-timestamps'

class Reply

  include DataMapper::Resource 

  property :id,       Serial
  property :content,  String
  property :created_at,   DateTime

  belongs_to :post
  belongs_to :user

end
