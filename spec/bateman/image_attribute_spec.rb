require 'spec_helper'

describe Bateman::ImageAttribute do
  describe '#to_s' do
    context 'an HTML document with a twitter:image tag' do
      it 'returns the twitter:image value' do
        html = prepare_html(%q{<meta name="twitter:image" value="http://example.com/img/1.jpg"})

        attribute_object = Bateman::ImageAttribute.new(html)

        attribute_object.to_s.should eq('http://example.com/img/1.jpg')
      end
    end

    context 'an HTML document with an og:image tag and no twitter:image tag' do
      it 'returns the og:image value' do
        html = prepare_html(%q{<meta name="og:image" content="http://example.com/img/2.jpg"})

        attribute_object = Bateman::ImageAttribute.new(html)

        attribute_object.to_s.should eq('http://example.com/img/2.jpg')
      end
    end

    context 'an HTML document without a twitter/og tag with image information' do
      it 'returns an empty string' do
        html = prepare_html(%q{<head/>})

        attribute_object = Bateman::ImageAttribute.new(html)

        attribute_object.to_s.should be_empty
      end
    end
  end
end