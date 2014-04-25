class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
  end
  
  def create
    tweet = current_user.tweets.create(tweet_params)
    redirect_to :back
  end
  
  def destroy
    tweet = Tweet.delete params[:id]
    redirect_to :back
  end
  
  def retweet
    tweet = Tweet.find_by_id params[:id]
    retweeted = current_user.tweets.create(tweet: tweet.tweet, parent_id: tweet.id)
    redirect_to :back
  end
  
  private
  
  def tweet_params
    params.required(:tweet).permit(:tweet, :private)
  end
  
end
