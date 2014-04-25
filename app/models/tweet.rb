class Tweet < ActiveRecord::Base
  
  #associations
  belongs_to :user
  
  default_scope order('created_at DESC')
  
end
