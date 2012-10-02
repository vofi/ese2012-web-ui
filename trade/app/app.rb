require 'rubygems'
require 'sinatra'
require 'haml'
require 'tilt/haml'
require 'app/models/store/user'
require 'app/models/store/market'
require 'app/models/store/item'
require 'app/controllers/authentication'
require 'app/controllers/main'

class App < Sinatra::Base

   use Authentication
   use Main

  enable :sessions
  set :public_folder, 'app/public'
  configure :development do

    @@market =Store::Market.new_market
    user1 =Store::User.named('Iron Man')
    user2 =Store::User.named('Captain America')
    user3 =Store::User.named('Hawk-eye')
    user4 =Store::User.named('ese')

    user1.save
    user2.save
    user3.save
    user4.save

    @@market.add_user(user1)
    @@market.add_user(user2)
    @@market.add_user(user3)
    @@market.add_user(user4)

    user1.create_item('Mark I', 20)
    user1.create_item('Mark II', 150)
    user1.create_item('Mark III', 110)

    user2.create_item('Shield', 70)
    user2.create_item('Cape', 10)

    user3.create_item('Bow', 40)
    user3.create_item('Arrow', 5)

    user4.create_item('Amoeba', 10 )
    user4.create_item('Bachelor Diploma', 350)

    user1.offer_item(0)
    user1.offer_item(1)

    user3.offer_item(0)
    user3.offer_item(1)

    user4.offer_item(1)

    @@market.get_items_to_sell
  end

end

App.run!
