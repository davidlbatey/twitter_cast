class Tweet < ActiveRecord::Base


  def self.all
    collect_tweets
  end

  private

  def self.collect_tweets
    tweets = []

    streams = Stream.all
    streams.each do |stream|
      stream_tweets = Twitter.search(stream.hashtag, :rpp => 10) 
      puts stream_tweets
      tweets << stream_tweets.collect(&:text) if stream_tweets
    end

    tweets.flatten.compact.reject(&:blank?)
  end

end
