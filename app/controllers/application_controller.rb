
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    Article.create(params)
    id = Article.last.id
    redirect "/articles/#{id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @id = params[:id]
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    #binding.pry
    @article = Article.find(params[:id])
    params.delete("_method")
    @article.update(params)
    redirect "/articles/#{id}"
  end 

  delete '/articles/:id' do
    #binding.pry
    @article = Article.find(params[:id])
    @article.destroy
    erb :index
  end



  


end
