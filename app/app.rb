ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

# A route controller built as a modular sinatra app
class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  set :session_secret, 'topsecretsecret'

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
    @repeat_email = params[:email]
    erb :'user/new'
  end

  post '/user' do
    user = User.create(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.valid?
      session['user_id'] = user.id
      redirect '/favourites'
    else
      flash.now[:error] = "Password and confirmation password do not match"
      redirect '/user/new'
    end
  end
end
