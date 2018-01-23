require 'sinatra/base'
require_relative 'models/favourite'

class BookmarkManager < Sinatra::Base
  get '/favourites' do
    @favourites = Favourite.all
    erb :'favourites/index'
  end

  post '/favourites' do
    Favourite.create(url: params[:url], title: params[:title])
    redirect '/favourites'
  end

  get '/favourites/new' do
    erb :'favourites/new'
  end
end
