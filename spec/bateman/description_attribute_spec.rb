require 'spec_helper'

describe Bateman::DescriptionAttribute do
  describe '#to_s' do
    context 'an HTML document with a twitter:description tag' do
      it 'returns the twitter:description value' do
        html = prepare_html(%q{<meta name="twitter:description" value="Huey Lewis and the News"})

        attribute_object = Bateman::DescriptionAttribute.new(html)

        attribute_object.to_s.should eq('Huey Lewis and the News')
      end
    end

    context 'an HTML document with an og:description tag and no twitter:description tag' do
      it 'returns the og:description value' do
        html = prepare_html(%q{<meta name="og:description" content="Genesis"})

        attribute_object = Bateman::DescriptionAttribute.new(html)

        attribute_object.to_s.should eq('Genesis')
      end
    end

    context 'an HTML document without a twitter/og tag with description information' do
      it 'returns an empty string' do
        html = prepare_html(%q{<head/>})

        attribute_object = Bateman::DescriptionAttribute.new(html)

        attribute_object.to_s.should be_empty
      end
    end
  end
end