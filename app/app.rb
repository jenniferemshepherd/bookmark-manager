ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'

# A route controller built as a modular sinatra app
class BookmarkManager < Sinatra::Base
  get '/favourites' do
    @favourites = Link.all
    erb :'favourites/index'
  end

  post '/favourites' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/favourites'
  end

  get '/favourites/new' do
    erb :'favourites/new'
  end
end
