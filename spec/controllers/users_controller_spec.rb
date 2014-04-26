require 'spec_helper'

describe UsersController do

  before(:each) do
    sign_in_user
    @user ||= FactoryGirl.create :user
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end
  
  describe 'GET /users' do
    it "should render 'index' action" do
      get :index
      expect(response).to be_success
    end
  end
  
  describe "GET /:name" do
    it "should go to users show action" do
      get :show, :name => @user.user_name
      expect(response).to be_success
    end
  end
  
  describe "POST /users" do
    it "should add a follower" do
      new_user = FactoryGirl.create(:user)
      post :add_follower, :id => @user.id, :user_id => new_user.id
      response.should redirect_to "where_i_came_from"
    end
  end
    
  describe "DELETE /users" do
    it "should remove a follower" do
      new_user = FactoryGirl.create(:user)
      post :add_follower, :id => @user.id, :user_id => new_user.id
      response.should redirect_to "where_i_came_from"
      delete :remove_follower, :id => @user.id, :user_id => new_user.id
      response.should redirect_to "where_i_came_from"
    end
  end
  
  
end