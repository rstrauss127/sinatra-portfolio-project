class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "carcollection"
  end

  get '/' do
    "Welcome to our Vacation rental site. If you own a vacation property and would like to list it, click here___.
    If you would like to sign up to see available vacations, click here_____"
  end

  helpers do

    def logged_in?
      !!session[:email]
    end

    def login(email, password)
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:email] = user.email
      else
        redirect '/login'
      end
      #check if a user with this email actually exists
      #if so, set the session
      #otherwise, return false or redirext '/login'

    end

    def logout!
      session.clear
    end
  end

end
