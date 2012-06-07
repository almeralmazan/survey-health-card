require 'sinatra'
require 'data_mapper'
require 'haml'
require File.expand_path('../model.rb', __FILE__)

# home page
get '/' do
  @title = 'Health Card Subscription'
  haml :index
end

# create record
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
    #status 201
    haml :success
  else
    #status 412
    redirect '/failed'
  end
end
