module Website
  class App
    module MarkdownHelper
    
      def create_parser
      	options = {hard_wrap: true, filter_html: true, no_intra_emphasis: true, autolink: true}
      	renderer = Redcarpet::Render::HTML.new(options)
        Redcarpet::Markdown.new(renderer, extensions = {})
      end
    end

    helpers MarkdownHelper
  end
end