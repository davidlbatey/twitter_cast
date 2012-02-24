class Tweet < ActiveRecord::Base

  def self.from_streams
    tweets = []
    streams = Stream.all
    
    streams.each do |stream|
      tweets << Twitter.search(stream.hashtag, :rpp => 10)  
    end

    tweets.flatten.compact
  end

end
