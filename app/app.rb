require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    p @links = Link.all
    erb(:'links/index')
  end

   run! if app_file == $0
end
