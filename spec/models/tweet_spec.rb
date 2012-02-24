require 'spec_helper'

describe Tweet do

  describe ".from_streams" do
    
    it "returns all the tweets from twitter" do
      tweets = [1, 2, 3, 4, 5]      
      stream = mock stream, hashtag: "spec"

      Stream.stub(:all).and_return([stream])
      Twitter.stub(:search).and_return(tweets)

      Tweet.from_streams.count.should == 5
      Tweet.from_streams.should == tweets
    end

    it "flattens to a single array" do
      tweets   = [1, 2, 3, 4]
      tweets_2 = ["a", "b"]
      stream = mock stream, hashtag: "spec"

      Stream.stub(:all).and_return([stream, stream])
      Twitter.stub(:search).and_return(tweets, tweets_2)

      Tweet.from_streams.count.should == 6
    end

    it "doesn't freak out when a stream returns empty array" do
      tweets   = [1, 2, 3]
      tweets_2 = []
      tweets_3 = ["a", "b", "c"]
      stream = mock stream, hashtag: "spec"

      Stream.stub(:all).and_return([stream, stream, stream])
      Twitter.stub(:search).and_return(tweets, tweets_2, tweets_3)

      Tweet.from_streams.count.should == 6
    end

  end

end
