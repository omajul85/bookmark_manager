ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'

class BM < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  helpers do
    # returns an instance of User for the currently logged-in user
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], 
      password_confirmation: params[:password_confirmation])
    
    #save returns true/false depending on whether the model is successfully saved to the database.
    if @user.save
      #save the user_id in the session
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end