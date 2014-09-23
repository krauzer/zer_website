Website::App.controllers :pieces do 
  layout :pieces

  get :show, map: "/pieces/:id" do 
    markdown = create_parser 
    @piece = Piece.find(params[:id])
    unless @piece.nil? 
      @title = @piece.title
      @text = markdown.render(@piece.body).html_safe
      @addition = markdown.render(@piece.addition).html_safe unless @piece.addition.nil?
    end
    erb :"pieces/show"
  end

end