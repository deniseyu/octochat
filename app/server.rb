require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/user'
require_relative 'models/post'
require_relative 'models/reply'
require_relative 'datamapper_helper'
require_relative 'helpers/application'
enable :sessions
set :session_secret, 'this is super secret ;)'
use Rack::Flash 
set :partial_template_engine, :erb


get '/' do 
  @users = User.all
  @posts = Post.all 
  @replies = Reply.all
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

get '/sessions/new' do 
  erb :"sessions/new"
end

post '/sessions' do 
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id 
    redirect '/'
  else
    flash[:errors] = ["The email or password is incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  flash[:notice] = "Good bye!"
  session[:user_id] = nil
  redirect to('/')
end

post '/posts/new' do 
  @post = Post.create(:content => params[:content],
                      :username => params[:username],
                      :realname => params[:realname])
  @post.save
  redirect to '/'
end

get '/posts/reply/:id' do 
  @post = Post.first(:id => params[:id])
  erb :"posts/new_reply"
end

post '/posts/reply/:id' do
  @post = Post.first(:id => params[:id])
  @reply = Reply.create(:reply_content => params[:reply_content],
                        :username => params[:username],
                        :realname => params[:realname],
                        :post_id => params[:post_id])
  @reply.save
  redirect to '/'
end

