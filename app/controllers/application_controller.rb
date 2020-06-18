
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
     "CreateReadUpdateDelete - It's a bunch of CRUD!!"
  end

  get '/articles/new' do 
    erb :new 
  end 

  post '/articles' do
    Article.create(params)
    id = Article.all.last.id 
    redirect "/articles/" << id.to_s
  end 

  get '/articles' do 
    @articles = Article.all 
    erb :index 
  end 

  get '/articles/:id' do 
    @article = Article.find_by_id(params[:id])
    erb :show
  end 

  get '/articles/:id/edit' do 
    @article = Article.find_by_id(params[:id])
    erb :edit 
  end 

  patch '/articles/:id' do 
    id = params[:id]
    new_params = {}
    old_article = Article.find_by_id(id)
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    old_article.update(title: new_params[:title], content: new_params[:content])
    redirect "/articles/" << id.to_s
  end 

  delete '/articles/:id/delete' do 
    
    @article = Article.find(params[:id]) 
    @article.destroy 
    erb :delete 
  end 








end
