DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/health_card_subs.db")

class Person

  include DataMapper::Resource

  property :id,             Serial
  property :name,           String
  property :gender,         String
  property :age,            String
  property :region,         String
  property :nature,         Text
  property :email,          String
  property :cpno,           String
  property :second_answer,  Text
  property :third_answer,   Text
  property :fourth_answer,  Text
  property :created_at,     DateTime
  property :updated_at,     DateTime

end

# Create or upgrade all tables at once, like magic
DataMapper.auto_upgrade!
