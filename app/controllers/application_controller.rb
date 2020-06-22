
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get 'Article/new' do
    erb :new
  end

  post'/Articles' do
    binding.pry
    Article.create(news: params[:news])
  end
end
