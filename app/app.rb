ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

# A route controller built as a modular sinatra app
class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/favourites' do
    @email = session['email']
    @favourites = Link.all
    erb :'favourites/index'
  end

  post '/favourites' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
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

  get '/signup' do
    erb :'signup/index'
  end

  post '/registered' do
    User.create(email: params[:email], password: params[:password])
    session['email'] = params[:email]
    redirect '/favourites'
  end
end
