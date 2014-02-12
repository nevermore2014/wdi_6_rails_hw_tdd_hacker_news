FactoryGirl.define do

  factory :user do
    email { Faker::Internet.email }
    password 'swordfish'
  end

  factory :post do
    user
    title 'Top 10 Today'
    body 'This is an empty post'
  end

  factory :comment do
    user
    post
    body 'Pretty decent'
  end


end
