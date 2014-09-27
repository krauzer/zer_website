Website::App.controllers :log do 

	get :index do 
		markdown = create_parser 
		@piece = Piece.find_by_title("Log")
		@topics = Frame.find_by_name("main").sub_topics
		unless @piece.nil? 
			@text = markdown.render(@piece.body).html_safe
		end
		erb :"topics/index"
	end 

  get :show, map: "/log/:topic" do
    @topic = Topic.find_by_name(params[:topic])
    redirect "errors/404" if @topic.nil?
    @piece =  @topic.pieces.first
    unless @piece.nil? 
      @text = @piece.body_sample
    end
    @topics = @topic.sub_topics 
    erb :"topics/show"
  end 
end