require 'sinatra/base'
require_relative 'models/favourite'

class Bookmark < Sinatra::Base

  get '/favourites' do
    @favourites = Favourite.all
    erb :'favourites/index'
  end
end
