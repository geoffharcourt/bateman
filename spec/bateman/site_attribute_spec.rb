require 'spec_helper'

describe Bateman::SiteAttribute do
  describe '#to_s' do
    context 'an HTML document with a twitter:site tag' do
      it 'returns the twitter:site value' do
        html = prepare_html(%q{<meta name="twitter:site" content="@example_site"})

        attribute_object = Bateman::SiteAttribute.new(html)

        attribute_object.to_s.should eq('@example_site')
      end
    end

    context 'an HTML document without a twitter:site tag' do
      it 'returns an empty string' do
        html = prepare_html(%q{<head/>})

        attribute_object = Bateman::SiteAttribute.new(html)

        attribute_object.to_s.should be_empty
      end
    end
  end
end