require 'spec_helper'

describe Bateman::CardAttribute do
  describe '#to_s' do
    context 'an HTML document with a twitter:card tag' do
      it 'returns the twitter:card value' do
        html = prepare_html(%q{<meta name="twitter:card" content="summary"})

        attribute_object = Bateman::CardAttribute.new(html)

        attribute_object.to_s.should eq('summary')
      end
    end

    context 'an HTML document without a twitter:card tag' do
      it 'returns "summary"' do
        html = prepare_html(%q{<head/>})

        attribute_object = Bateman::CardAttribute.new(html)

        attribute_object.to_s.should eq('summary')
      end
    end
  end
end