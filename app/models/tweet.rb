class Tweet < ActiveRecord::Base
  
  #associations
  belongs_to :user
  
  default_scope order('created_at DESC')
  
  def retweet_able? follower
    !private or user.followers.include?(follower)
  end
  
end
