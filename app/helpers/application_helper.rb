module ApplicationHelper
  
  def retweet_able? user, tweet
    !tweet.private or tweet.user.followers.include?(user)
  end
  
end
