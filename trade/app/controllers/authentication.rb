require 'tilt/haml'
require 'app/models/store/user'
require 'haml'


class Authentication < Sinatra::Application

  get '/login' do
    current_session = session[:current_session]
    session[:current_session]= nil
    haml :login, :locals  => {:current_session => current_session}
  end

  post '/login' do
    name= params[:username]
    password= params[:password]
    user = Store::User.by_name name
    if user.nil? or password!=name
      session[:current_session] = "Login failed"
      redirect '/login'
    else
      session[:name]= name
      redirect '/'
    end
  end
end

