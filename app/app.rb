require 'sinatra/base'
require_relative 'models/favourite'

class BookmarkManager < Sinatra::Base
  get '/favourites' do
    @favourites = Favourite.all
    erb :'favourites/index'
  end
end
