require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  patch ("/artists/:id") do
  	@artist = Artist.find(params[:id])
  	@artist.update(params[:artist])
  	redirect to "artists/#{@artist.id}"
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

  get '/artists/:id/edit' do

    #get params from url
    @artist = Artist.find(params[:id]) #define intstance variable for view
  
    erb :'artists/edit' #show edit artist view
  
  end


  delete '/artists/:id' do

    #get params from url
    @artist = Artist.find(params[:id]) #define artist to delete
  
    @artist.destroy #delete artist
  
    redirect '/artists' #redirect back to artists index page
  
  end

end
