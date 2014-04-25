class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  #validations
  validates_uniqueness_of :user_name
  validates_presence_of :user_name
  
  #associations
  has_and_belongs_to_many :followers, :class_name => "User",
                          :association_foreign_key =>"follower_id",
                          :join_table => "follower_users", :uniq => true
  
  has_many                :tweets
  
  
  def to_s
    user_name.titleize
  end
  
  def to_param
    user_name
  end
  
  def add_follower follower_id
    follower = User.find_by_id follower_id
    followers << follower
  end
  
  def remove_follower follower_id
    follower = User.find_by_id follower_id
    new_followers = followers - [follower]
    self.followers = new_followers
    self.save
  end
  
end
