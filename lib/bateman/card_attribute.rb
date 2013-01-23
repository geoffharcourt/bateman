module Bateman
  class CardAttribute < MetaAttribute

    private

    def html_attribute
      'summary'
    end

    def attribute_name
      'card'
    end
  end
end