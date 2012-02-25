class TweetsController < ApplicationController
  def index
    @tweets = Tweet.from_streams
  end
end
