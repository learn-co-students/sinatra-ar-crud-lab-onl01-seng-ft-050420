require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
  end
  
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    article = Article.create(:title => params[:title], :content => params[:content])
    redirect "/articles/#{article.id}"
  end
  
  get '/articles/:id' do
    id = params[:id]
    article = Article.find(id)
    @articles = []
    @articles << article
    erb :show
  end
  
  get '/articles' do
    @articles = []
    @articles = Acticle.all
    erb :show
  end
  
end
