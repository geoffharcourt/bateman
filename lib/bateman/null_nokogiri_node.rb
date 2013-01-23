module Bateman
  class NullNokogiriNode
    def text
      String.new
    end

    def attributes
      {'href' => NullNokogiriNodeAttributes.new}
    end
  end

  class NullNokogiriNodeAttributes
    def value
      nil
    end
  end
end