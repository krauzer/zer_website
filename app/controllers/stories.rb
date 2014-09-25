Website::App.controllers :stories do 
	layout :stories

  get :index do 
    @stories = Story.all
    erb :"stories/index"
  end 
  
  layout :pieces
  get :show, map: "/stories/:id" do
    markdown = create_parser 
    @story = Story.find(params[:id])
    unless @story.nil? 
      @text = markdown.render(@story.body).html_safe
      @title = @story.title
    end
    erb :"stories/show"
  end 

end
