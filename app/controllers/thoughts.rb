Website::App.controllers :thoughts do

  get :index do
    load_thought_from_today
    load_thought_from_week
    erb :"thoughts/index"
  end

  layout :pieces
  get :show , map: "/thoughts/:day" do
    load_thought
   	parse_thought
    erb :"thoughts/show"
  end

private

  define_method :load_thought_from_today do
    @current_day = Thought.from_today
  end

  define_method :load_thought_from_week do
    @full_week = Thought.last_week
  end

  define_method :load_thought do
    @thought ||= Thought.find_day(params[:day]).first
  end

  define_method :parse_thought do
    markdown ||= create_parser
    @text = markdown.render(@thought.body).html_safe unless @thought.nil?
  end

end