Website::App.controllers :thoughts do 

  get :index do
    @current_day = Thought.from_today
    @full_week = Thought.last_week
    erb :"thoughts/index"
  end

end