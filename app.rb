require 'sinatra'
require 'data_mapper'
require 'haml'
require File.expand_path('../model.rb', __FILE__)

get '/' do
  @title = 'Health Card Subscription'
  haml :index
end

# create record
post '/create' do
  p = Person.new
  p.name = params[:name]
  p.gender = params[:gender]
  p.age = params[:age]
  p.region = params[:region]
  p.province = params[:province]
  p.nature = params[:nature]
  p.email = params[:email]
  p.cpno = params[:cpno]
  p.emp_hcp_ans1 = params[:emp_hcp_ans1]
  p.emp_hcp_ans2 = params[:emp_hcp_ans2]
  p.third_answer = params[:third_answer]
  p.fourth_answer = params[:fourth_answer]
  p.fin_con_ans1 = params[:fin_con_ans1]
  p.fin_con_ans2 = params[:fin_con_ans2]
  p.comments = params[:comments]

  if p.save
    #status 201
    redirect '/success'
  else
    #status 412
    redirect '/failed'
  end
end

# test only
post '/test' do
  person.name = params[:name]
end

