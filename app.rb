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


#================
# list all persons
#================
get '/list' do
  @title = 'Survey Health Card Subscription | Summary'
  @plist = Person.all
  erb :list
end


#================
# Helper methods
#================
helpers do

  def set_region(region)
    @region_val = region
  end

  def count_by(column, value)
    Person.count(:region => "#{@region_val}", :conditions => [ "#{column} = ?", "#{value}"])
  end

  def age_range_in
    min_age = Person.min(:age, :conditions => [ 'region = ?', "#{@region_val}" ])
    max_age = Person.max(:age, :conditions => [ 'region = ?', "#{@region_val}" ])

    if min_age.nil? || max_age.nil?
      "None"
    else
      "#{min_age} - #{max_age}"
    end
  end

  def count_emp_by(perma_or_contr)
    Person.count(:region => "#{@region_val}", :conditions => [ 'nature = ?', "#{perma_or_contr}" ])
  end

  def count_hmo_by(yes_or_no)
    Person.count(:region => "#{@region_val}", :conditions => [ 'emp_hcp_ans1 = ?', "#{yes_or_no}" ])
  end

  #-------------- DIVISIONS ------------------
  def set_division(div)
    @div_val = div
  end

  def count_male_or_female(div_gender)
    Person.count(:division => "#{@div_val}", :conditions => [ 'gender = ?', "#{div_gender}" ])
  end

  def age_range_div
    min_age = Person.min(:age, :conditions => [ 'division = ?', "#{@div_val}" ])
    max_age = Person.max(:age, :conditions => [ 'division = ?', "#{@div_val}" ])
    if min_age.nil? || max_age.nil?
      "None"
    else
      "#{min_age} - #{max_age}"
    end
  end

  def nature_emp_div(perma_or_contr)
    Person.count(:division => "#{@div_val}", :conditions => [ 'nature = ?', "#{perma_or_contr}" ])
  end

  def existing_hmo_div(yes_or_no)
    Person.count(:division => "#{@div_val}", :conditions => [ 'emp_hcp_ans1 = ?', "#{yes_or_no}" ])
  end

end
