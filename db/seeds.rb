image_num = 0
10.times do
  image_num += 1
  User.create!(
    [{
      name: Faker::Name.name,
      photo: "https://picsum.photos/20#{image_num}",
      bio: Faker::Lorem.paragraph(sentence_count: 6),
      email: Faker::Internet.email,
      password: "password"

    }])
end

image_num = 0
30.times do
  image_num += 1
  Post.create!(
    [{
      title: Faker::Book.title,
      text: Faker::Lorem.paragraph(sentence_count: 15),
      author_id: Faker::Number.between(from: 1, to: 9)
    }])
end

100.times do
  Comment.create!(
    [{
      text: Faker::Lorem.paragraph(sentence_count: 2),
      author_id: Faker::Number.between(from: 1, to: 10),
      post_id: Faker::Number.between(from: 1, to: 30)
    }])
end

100.times do
  Like.create!(
    [{
      author_id: Faker::Number.between(from: 1, to: 10),
      post_id: Faker::Number.between(from: 1, to: 30)
    }])
end