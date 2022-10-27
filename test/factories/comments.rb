FactoryBot.define do
  factory :comment do
    author_id { 1 }
    post_id { 1 }
    text { 'MyString' }
  end
end
