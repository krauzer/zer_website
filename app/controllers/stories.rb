Website::App.controllers :stories do
	layout :stories

  get :index do
    load_stories
    erb :"stories/index"
  end

  layout :pieces
  get :show, map: "/stories/:id" do
    load_story
    parse_story
    erb :"stories/show"
  end


private
  define_method :load_stories do
    @stories ||= Story.all
  end

  define_method :load_story do
    @story ||= Story.find(params[:id])
  end

  define_method :parse_story do
    markdown ||= create_parser
    unless @story.nil?
      @content = Hash.new
      @content[:title] = @story.title
      @content[:text] = markdown.render(@story.body).html_safe
    end
  end

end
