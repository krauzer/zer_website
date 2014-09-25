Website::App.controllers :thoughts do 

  get :index do
    @current_day = Thought.from_today
    @full_week = Thought.last_week
    erb :"thoughts/index"
  end

  get :show , map: "/thoughts/:day" do
    Thought.find_day(params[:day])
  end
end