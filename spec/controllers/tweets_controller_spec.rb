require 'spec_helper'

describe TweetsController do

  before(:each) do
    sign_in_user
    @user ||= FactoryGirl.create :user
    @tweet = FactoryGirl.create :tweet
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end
  
  describe 'GET /tweets' do
    it "should render 'index' action" do
      get :index
      expect(response).to be_success
    end
  end
  
  describe "Post 'create'" do
    it "should post tweet" do
      post :create, :tweet => {:tweet => "Test Tweet 1", :private => true}
      response.should redirect_to "where_i_came_from"
    end
  end
  
  describe "DELETE 'destroy'" do
    it "should delete tweet" do
      new_tweet = FactoryGirl.create :tweet
      delete :destroy, :id => new_tweet.id
      response.should redirect_to "where_i_came_from"
    end
  end
  
  describe "POST 'retweet'" do
    it "should retweet tweet" do
      new_tweet = FactoryGirl.create :tweet
      post :retweet, :id => new_tweet.id
      response.should redirect_to "where_i_came_from"
    end
  end
  
end