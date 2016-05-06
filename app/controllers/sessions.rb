class BM < Sinatra::Base
	post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/links'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  delete '/sessions' do
    session[:user_id] = nil
    # Keep to persist the flash notice over the redirect.
    flash.keep[:notice] = 'Goodbye!'
    redirect '/links'
  end
end