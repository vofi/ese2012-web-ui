require 'tilt/haml'
require 'app/models/store/user'

class Main < Sinatra::Application
  get "/" do
    redirect '/login' unless session[:name]
    current_session =session[:current_session]
    session[:current_session]=nil
    haml :main, :locals => {:users => Store::User.all,
                            :current_user => Store::User.by_name(session[:name]),
                            :current_session => current_session}
  end


end