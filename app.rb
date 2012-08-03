require 'sinatra'
require 'data_mapper'
require File.expand_path('../model.rb', __FILE__)


#================
# create page
#================
get '/new' do
  @title = 'Survey Health Card Subscription | Create'
  erb :index
end

#================
# home page
#================
get '/' do
  @title = 'Survey Health Card Subscription | PIA'
  erb :home
end


#================
# create record
#================
post '/create' do
  p              = Person.new
  p.name         = params[:name]
  p.gender       = params[:gender]
  p.age          = params[:age]
  p.region       = params[:region]
  p.province     = params[:province]
  p.division     = params[:division]
  p.nature       = params[:nature]
  p.email        = params[:email]
  p.cpno         = params[:cpno]
  p.other_cpno   = params[:other_cpno]
  p.emp_hcp_ans1 = params[:emp_hcp_ans1]
  p.emp_hcp_ans2 = params[:emp_hcp_ans2]
  p.ape          = params[:ape]
  p.ipc          = params[:ipc]
  p.opc          = params[:opc]
  p.ec           = params[:ec]
  p.dc           = params[:dc]
  p.fca          = params[:fca]
  p.others       = params[:others]
  p.no_answer    = params[:no_answer]
  p.fin_con_ans1 = params[:fin_ans1]
  p.fin_con_ans2 = params[:fin_amount]
  p.comments     = params[:comments]

  if p.save
    @title = "Success Page"
    erb :success
  else
    #status 412
    redirect '/failed'
  end
end


#==================
# list all persons
#==================
get '/list' do
  @title = 'Survey Health Card Subscription | Summary'
  @plist = Person.all
  erb :list
end


#================
# Helper methods
#================
helpers do

  def count_emp_by col_name, type
    Person.count(:conditions => ["#{col_name} = ?", "#{type}"])
  end
  
  def count_gender_per_nature gender, nature
    Person.all(:gender => "#{gender}").count(:nature => "#{nature}")
  end

end
