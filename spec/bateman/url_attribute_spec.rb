require 'spec_helper'

describe Bateman::UrlAttribute do
  describe '#to_s' do
    context 'an HTML document with a twitter:url tag' do
      it 'returns the twitter:url value' do
        html = prepare_html(%q{<meta name="twitter:url" value="http://example.com/articles/1"})

        attribute_object = Bateman::UrlAttribute.new(html)

        attribute_object.to_s.should eq('http://example.com/articles/1')
      end
    end

    context 'an HTML document with an og:url tag and no twitter:url tag' do
      it 'returns to the og:url value' do
        html = prepare_html(%q{<meta name="og:url" content="http://example.com/articles/2"})

        attribute_object = Bateman::UrlAttribute.new(html)

        attribute_object.to_s.should eq('http://example.com/articles/2')
      end
    end

    context 'an HTML document without a twitter/og url tag and a canonical link' do
      it 'returns the canonical link href' do
        html = prepare_html(%q{<link rel="canonical" href="http://example.com/articles/3" />})

        attribute_object = Bateman::UrlAttribute.new(html)

        attribute_object.to_s.should eq('http://example.com/articles/3')
      end
    end

    context 'an HTML document with no twitter/og url tag or canonical link tag' do
      context 'when initialized with a uri argument' do
        it 'returns the uri as a string' do
          html = prepare_html('html')

          attribute_object = Bateman::UrlAttribute.new(html, 'http:://example.com/articles/4')

          attribute_object.to_s.should eq('http:://example.com/articles/4')
        end
      end


      context 'without a supplied uri argument' do
        it 'returns an empty string' do
          html = prepare_html('<html/>')

          attribute_object = Bateman::UrlAttribute.new(html)

          attribute_object.to_s.should eq('')
        end
      end
    end
  end
end