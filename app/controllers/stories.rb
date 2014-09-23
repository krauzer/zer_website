Website::App.controllers :stories do 
	layout :stories

  get :index do 
    @stories = Story.all
    erb :"stories/index"
  end 

  get :show, map: "/stories/:id" do 
    @story = Story.find(params[:id])
    erb :"stories/show"
  end 
end