ENV["RACK_ENV"] ||= "development"

require_relative 'datamapper_setup'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new_link')
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tags = params[:tag].split(', ')
    tags.each { |tag| link.tags << Tag.first_or_create(name: tag)}
    link.save
    redirect('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb(:'users/new_user')
  end

  post '/users' do
    User.first_or_create(email: params[:email], password: params[:password])
    redirect('/links')
  end

  run! if app_file == $0

end
