ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

# A route controller built as a modular sinatra app
class BookmarkManager < Sinatra::Base
  get '/favourites' do
    @favourites = Link.all
    erb :'favourites/index'
  end

  post '/favourites' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/favourites'
  end

  get '/favourites/new' do
    erb :'favourites/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @favourites = tag ? tag.links : []
    erb :'favourites/index'
  end
end
