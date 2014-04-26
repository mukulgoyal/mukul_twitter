require "spec_helper"

describe User do
  let(:user) { FactoryGirl.create(:user) }

  it "should be valid" do
    user.should be_valid
  end

  it "should have proper associations" do
    user.followers.class.should be ActiveRecord::Associations::CollectionProxy::ActiveRecord_Associations_CollectionProxy_User
    user.tweets.class.should be ActiveRecord::Associations::CollectionProxy::ActiveRecord_Associations_CollectionProxy_Tweet
  end

  it "should add a follower" do
    user.followers.count.should == 0
    new_user = FactoryGirl.create(:user)
    user.add_follower new_user.id
    user.followers.count.should == 1
  end

  it "should remove a follower" do
    user.followers.count.should == 0
    new_user = FactoryGirl.create(:user)
    user.add_follower new_user.id
    user.followers.count.should == 1
    user.remove_follower new_user.id
    user.followers.count.should == 0
  end

end