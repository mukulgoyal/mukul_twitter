require 'spec_helper'

describe Tweet do

  let(:tweet) { FactoryGirl.create(:tweet) }

  it "has a valid factory" do
    tweet.should be_valid
  end

  it "should have proper associations" do
    tweet.user.class.should be User
  end

  it "should be retweet_able" do
    user = FactoryGirl.create(:user)
    tweet.retweet_able?(user).should be true
  end

  it "should not be retweet_able" do
    new_tweet = FactoryGirl.create(:tweet, private: true)
    new_tweet.retweet_able?(tweet.user).should be false
  end

  it "should be retweetable by follower only" do
    new_tweet = FactoryGirl.create(:tweet, private: true)
    new_tweet.user.add_follower tweet.user
    new_tweet.retweet_able?(tweet.user).should be true
  end

end