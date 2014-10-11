require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/user'
require_relative 'datamapper_helper'
enable :sessions
set :session_secret, 'this is super secret ;)'
use Rack::Flash 
set :partial_template_engine, :erb


get '/' do 
  @users = User.all
  erb :index
end

post '/users' do 
  @user = User.create(
              :username => params[:username],
              :realname => params[:realname],
              :email => params[:email],
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id 
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
end

get '/users/new' do 
  @user = User.new
  erb :"users/new"
end


