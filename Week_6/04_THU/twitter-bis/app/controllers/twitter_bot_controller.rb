class TwitterBotController < ApplicationController
  def index
  end

  def send_tweet
    SendTweet.new(params_twitter[:tweet_content]).perform
  end

  private

  def params_twitter
    params.permit(:tweet_content)
  end
end
