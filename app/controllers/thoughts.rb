Website::App.controllers :thoughts do 

  get :index do
    @current_day = Thought.from_today
    @full_week = Thought.last_week
    erb :"thoughts/index"
  end
 
  layout :pieces
  get :show , map: "/thoughts/:day" do
  	markdown = create_parser
    @thought = Thought.find_day(params[:day]).first
   	@text = markdown.render(@thought.body).html_safe unless @thought.nil?
    erb :"thoughts/show" 
  end
end