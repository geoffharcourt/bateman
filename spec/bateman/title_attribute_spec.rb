require 'spec_helper'

describe Bateman::TitleAttribute do
  describe '#to_s' do
    context 'an HTML document with a twitter:title tag' do
      it 'returns the twitter:title value' do
        html = prepare_html(%q{<meta name="twitter:title" value="Huey Lewis and the News"})

        attribute_object = Bateman::TitleAttribute.new(html)

        attribute_object.to_s.should eq('Huey Lewis and the News')
      end
    end

    context 'an HTML document with an og:title tag and no twitter:title tag' do
      it 'returns the og:title value' do
        html = prepare_html(%q{<meta name="og:title" content="Genesis"})

        attribute_object = Bateman::TitleAttribute.new(html)

        attribute_object.to_s.should eq('Genesis')
      end
    end

    context 'an HTML document without a twitter/og tag with title information' do
      it 'returns the HTML <title> tag text' do
        html = prepare_html(%q{<title>Phil Collins</title>})

        attribute_object = Bateman::TitleAttribute.new(html)

        attribute_object.to_s.should eq('Phil Collins')
      end
    end

    context 'an HTML document with no twitter/og title tag or <title> tag' do
      it 'returns an empty string' do
        html = prepare_html('')

        attribute_object = Bateman::TitleAttribute.new(html)

        attribute_object.to_s.should eq('')
      end
    end
  end
end