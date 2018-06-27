#### Users
User.create!(username:  "Sean",
             email: "sean.n.cordes@gmail.com",
             gender: "Male",
             password:              "password",
             password_confirmation: "password")

99.times do |n|
  username  = "user#{n+1}"
  email = "example-#{n+1}@gmail.com"
  password = "password"
  if n.to_i.even?
    gender = "Male"
  else
    gender = "Female"
  end
  User.create!(username:  username,
              email: email,
              gender: gender,
              password:              password,
              password_confirmation: password)
end

#### Relationship
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]

following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

#### Posts && Cards && Clothing
users = User.all
users = users[1..10]

users.each do |user|
  3.times do |n|
    image = File.open(File.join(Rails.root, "public/test_images/#{n+1}.png"))
    description = Faker::Seinfeld.quote

    post = user.posts.create!(image: image,
                      gender: user.gender,
                      description: description)

    card = post.cards.create!(user_id: user.id)

    user.votes.create!(card_id: card.id,
                       vote: true)

    2.times do |n|
      description2 = Faker::Friends.quote
      url = "https://amazon.com"
      if n.to_i.even?
        title = "Shirt"
      else
        title = "Pants"
      end

      post.clothing_articles.create!(user_id: user.id,
                                    title: title,
                                    description: description2,
                                    url: url)
    end
  end
end

#### Likes
posts = Post.all
users = User.all
posts = posts[1..10]
users = users[1..10]

posts.each do |post|
  users.each do |user|
    user.like(post)
  end
end