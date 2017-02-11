FactoryGirl.define do
  pw = RandomData.random_sentence
  factory :user do
    username RandomData.random_name
    sequence(:email){|n| "username#{n}@factory.com"}
    password pw
    password_confirmation pw
    role :standard
  end
end
