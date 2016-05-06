class BM < Sinatra::Base
  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], 
      password_confirmation: params[:password_confirmation])
    
    #save returns true/false depending on whether the model is successfully saved to the database.
    if @user.save
      #save the user_id in the session
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end
end