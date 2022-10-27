FactoryBot.define do
  factory :post do
    text { 'MyString' }
    title { 'MyString' }
    likes_count { 1 }
    comments_count { 1 }
    author_id { 1 }
  end
end
