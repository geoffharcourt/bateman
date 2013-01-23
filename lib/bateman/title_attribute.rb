module Bateman
  class TitleAttribute < MetaAttribute

    private

    def attribute_name
      'title'
    end

    def html_attribute
      (@html.at_css('title') || NullNokogiriNode.new).text
    end
  end
end