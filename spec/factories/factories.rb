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

  factory :votable do
    user
    post
    comment
    direction true
  end

  factory :votable do
    user
    post
    direction true
  end

end
