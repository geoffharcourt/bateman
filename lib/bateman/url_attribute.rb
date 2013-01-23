module Bateman
  class UrlAttribute < SiteAttribute
    def initialize(html, uri = nil)
      @uri = uri.to_s

      super(html)
    end

    private

    def extract_attribute
      super || @uri
    end

    def attribute_name
      'url'
    end

    def html_attribute
      (@html.at_css(%q{link[rel="canonical"]}) || NullNokogiriNode.new).attributes['href'].value
    end
  end
end