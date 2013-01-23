require 'spec_helper'

describe Bateman::CreatorAttribute do
  context 'an HTML document with a twitter:creator tag' do
    it 'returnsthe twitter:creator value' do
      html = prepare_html(%q{<meta name="twitter:creator" content="@example"})

      attribute_object = Bateman::CreatorAttribute.new(html)

      attribute_object.to_s.should eq('@example')
    end
  end

  context 'an HTML document without a twitter:creator tag' do
    it 'returns an empty string' do
      html = prepare_html(%q{<head/>})

      attribute_object = Bateman::CreatorAttribute.new(html)

      attribute_object.to_s.should be_empty
    end
  end
end