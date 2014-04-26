FactoryGirl.define do
  factory :tweet do
    tweet { Faker::Lorem.sentence }

    association :user, factory: :user
  end
  
end