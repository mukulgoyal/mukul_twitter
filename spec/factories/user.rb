FactoryGirl.define do 
  factory :user do 
    user_name { "dummy#{rand(100000)}" }
    sequence(:email) {|n| "#{user_name}#{n + rand(100000)}@twitter.com" }

    password "new_passwords"
    password_confirmation "new_passwords"
    
  end
end

