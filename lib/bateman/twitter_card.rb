module Bateman
  class TwitterCard
    attr_reader :card, :creator, :description, :image, :site, :title, :url

    def initialize(url)
      @uri = URI.parse(url)

      fetch
      process_html_document
      set_attributes_from_response
    end

    def set_attributes_from_response
      @card = Bateman::CardAttribute.new(@html_document).to_s
      @creator = Bateman::CreatorAttribute.new(@html_document).to_s
      @description = Bateman::DescriptionAttribute.new(@html_document).to_s
      @image = Bateman::ImageAttribute.new(@html_document).to_s
      @site = Bateman::SiteAttribute.new(@html_document).to_s
      @title = Bateman::TitleAttribute.new(@html_document).to_s
      @url = Bateman::UrlAttribute.new(@html_document, @uri).to_s
    end

    def fetch
      @response = HTTParty.get(@uri.to_s)

      self
    end

    def process_html_document
      @html_document = Nokogiri::HTML(@response.body)

      self
    end

  end
end