module Bateman
  class MetaAttribute
    def initialize(html)
      @html = html
      @attribute = extract_attribute
    end

    def to_s
      @attribute.to_s
    end

    private

    def extract_attribute
      relevant_meta_tag_value || html_attribute
    end

    def relevant_meta_tag_value
      value_containing_meta_tag_attributes.map{|_k, v| v.value}.first
    end

    def value_containing_meta_tag_attributes
      meta_tag_attributes.select{|key, _v| value_attributes.include?(key)}
    end

    def meta_tag_attributes
      meta_tag.attributes
    end

    def meta_tag
      @html.search(tag_selector).first || NullTwitterMetaTag.new
    end

    def tag_selector
      possible_selectors.join(', ')
    end

    def possible_selectors
      protocol_attributes.inject([]) do |memo, protocol|
        name_attributes.each do |name_attribute|
          memo << %Q{meta[#{name_attribute}="#{protocol}:#{attribute_name}"]}
        end

        memo
      end
    end

    def name_attributes
      %w(name property)
    end

    def protocol_attributes
      %w(twitter og)
    end

    def value_attributes
      %w(content value)
    end

    def html_attribute
      nil
    end
  end

  class NullTwitterMetaTag
    def attributes
      []
    end
  end
end