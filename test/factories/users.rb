FactoryBot.define do
  factory :user do
    name { 'MyString' }
    photo { 'MyString' }
    bio { 'This is my bio' }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
