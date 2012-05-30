DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/health_card_subs.db")

class Person

  include DataMapper::Resource

  property :id,             Serial
  property :name,           String
  property :gender,         String
  property :age,            String
  property :region,         String
  property :province,       String
  property :nature,         String
  property :email,          String
  property :cpno,           String
  property :emp_hcp_ans1,   String
  property :emp_hcp_ans2,   String
  property :ape,            String
  property :ipc,            String
  property :opc,            String
  property :ec,             String
  property :dc,             String
  property :fca,            String
  property :others,         String
  property :no_answer,      String
  property :fin_con_ans1,   String
  property :fin_con_ans2,   String
  property :comments,       Text

end

# Create or upgrade all tables at once, like magic
DataMapper.auto_upgrade!
