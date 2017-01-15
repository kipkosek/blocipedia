FactoryGirl.define do
  pw = RandomData.random_sentence
  factory :username do
    name RandomData.random_name
    sequence(:email){|n| "username#{n}@factory.com"}
    password pw
    password_confirmation pw
  end
end
