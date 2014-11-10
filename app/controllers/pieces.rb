Website::App.controllers :pieces do
  layout :pieces

  get :show, map: "/pieces/:id" do
    load_piece
    parse_piece
    erb :"pieces/show"
  end

private

  define_method :load_piece do
    @piece ||= Piece.find(params[:id])
  end

  define_method :parse_piece do
    markdown ||= create_parser
    unless @piece.nil?
      @content = Hash.new
      @content[:title] = @piece.title
      @content[:text] = markdown.render(@piece.body).html_safe
      @content[:addition] = markdown.render(@piece.addition).html_safe unless @piece.addition.nil?
    end
  end

end