require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end
  
  post '/artists' do
    @artist = Artist.create(params)
    redirect("/artists/#{@artist.id}")
  end

  get '/artists' do
    @artists = Artist.all #define instance variable for view
    erb :'artists/index' #show all artists view (index)
  end

  get '/artists/new' do
    erb :'artists/new' #show new artists view
  end

  get '/artists/:id' do
    #gets params from url
    @artist = Artist.find(params[:id]) #define instance variable for view
    erb :'artists/show' #show single artist view
  end

end
