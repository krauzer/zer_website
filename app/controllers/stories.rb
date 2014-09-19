Website::App.controllers :stories do 
	layout :stories

  get :index do 
    @stories = Story.all
    erb :"stories/index"
  end 
	
end