ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

# A route controller built as a modular sinatra app
class BookmarkManager < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.first(id: session['user_id'])
    end
  end

  get '/favourites' do
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

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    user = User.create(email: params[:email], password: params[:password])
    session['email'] = params[:email]
    session['user_id'] = user.id
    redirect '/favourites'
  end
end
