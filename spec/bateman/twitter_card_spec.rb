require 'spec_helper'

describe Bateman::TwitterCard do
  def request_payload(filename)
    IO.readlines("./spec/fixtures/#{filename}.html").join
  end

  context "fully filled out Twitter Card" do
    before(:each) do
      @url = 'http://example.com/article_1'
    end

    describe "#initialize" do
      before(:each) do
        FakeWeb.register_uri(
          :get,
          "http://example.com/article_1",
          body: request_payload('valid_twitter_card')
        )

        @twitter_card = Bateman::TwitterCard.new(@url)
     end

      it "sets the title of the TwitterCard", :focus do
        @twitter_card.title.should eq('Propellerheads Are Back')
      end

      it "sets the url of the TwitterCard" do
        @twitter_card.url.should eq('http://www.example.com/123456789')
      end

      it "sets the card type of the TwitterCard" do
        @twitter_card.card.should eq('summary')
      end

      it "sets the site handle of the TwitterCard" do
        @twitter_card.site.should eq('@example_site')
      end

      it "sets the creator handle of the TwitterCard" do
        @twitter_card.creator.should eq('@example_author')
      end


      it "sets the description of the TwitterCard" do
        @twitter_card.description.should eq('It\'s as if they never went away!')
      end

      it "sets the image url of the TwitterCard" do
        @twitter_card.image.should eq('http://example.com/images/velvet_pants.jpg')
      end
    end
  end
end