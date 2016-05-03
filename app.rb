require 'sinatra/base'
require './models/link'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  # Receive the form data and create a new link
  post '/links' do
  	Link.create(title: params[:title], url: params[:url])
  	redirect './links'
  end

  # Serve a form for creating a new link
  get '/links/new' do
  	erb :'links/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end


# We are declaring post /links rather than post /links/new because we 
# are following RESTful conventions. In our case, GET /links should 
# return a list of links, while POST /links should create a new link, 
# while GET links/new is getting a form for creating a new link.