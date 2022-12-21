image_num = 0
5.times do
  image_num = image_num + 1
  User.create!(
    [{
      name: Faker::Name.name,
      photo: "https://picsum.photos/20#{image_num}",
      bio: Faker::Lorem.paragraph(sentence_count: 3),
      email: Faker::Internet.email,
      password: "secrete"

    }])
end

20.times do
  Post.create!(
    [{
      title: Faker::Quote.matz,
      text: Faker::Lorem.paragraph(sentence_count: 15),
      author_id: User.all.sample.id,
    }])
end

30.times do
  Comment.create!(
    [{
      text: Faker::Lorem.paragraph(sentence_count: 2),
      author_id: User.all.sample.id,
      post_id: Post.all.sample.id,
    }])
end

30.times do
  Like.create!(
    [{
      author_id: User.all.sample.id,
      post_id: Post.all.sample.id,
    }])
end

User.create(
  name:"John Doe", 
  photo: "https://picsum.photos/200",
  bio: Faker::Lorem.paragraph(sentence_count: 3),
  email: "john@test.com",
  password: "secrete"
)