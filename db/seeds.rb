require 'faker'


if Tag.all.count == 0
  Tag.create!(name: "Japan")
  Tag.create!(name: "US")
  Tag.create!(name: "UK")
  Tag.create!(name: "Germany")
end

if User.count == 0
  name = "test"
  email = "test@example.com"
  password = "password"
  introduction = "i am test user."
  User.create!(name: name, email: email, password: password, introduction: introduction)
end


4.times do |n|
  name = Faker::Football.player
  email = Faker::Internet.email
  password = "password"
  introduction = Faker::Food.measurement
  User.create!(name: name, email: email, password: password, introduction: introduction)
end

n = 0

5.times do |n|
  n += 1
  name = Faker::Food.dish
  assetable_id = n
  Asset.create!({
    image: open("app/assets/images/rondo.jpg"),
    assetable_type: "User",
    assetable_id: n
    })
end

n = 0

5.times do |n|
  n += 1
  state = Faker::Nation.capital_city
  addressable_id = n
  Address.create!({state: state, addressable_type: "User", addressable_id: n })
end

20.times do |n|
  description = Faker::Food.spice
  user_id = User.all.sample.id
  Post.create!({ description: description, user_id: user_id})
end

n = 0

20.times do |n|
  n += 1
  name = Faker::Food.fruits
  post_id = n
  Thing.create!({ name: name, post_id: post_id})
end

n = 0

20.times do |n|
  n += 1
  name = Faker::Nation.nationality
  post_id = n
  Place.create!({name: name, post_id: post_id})
end

n = 0

# 20.times do |n|
#   n += 1
#   name = Faker::Food.dish
#   assetable_id = n
#   Asset.create!({
#     image: open("app/assets/images/levis.jpg"),
#     assetable_type: "Post",
#     assetable_id: n
#     })
# end

20.times do |n|
  n += 1
  name = Faker::Food.dish
  assetable_id = n
  Asset.create!({
    image: open("app/assets/images/levis.jpg"),
    assetable_id: n,
    assetable_type: "Thing"
    })
end

n = 0

20.times do |n|
  n += 1
  state = Faker::Nation.capital_city
  addressable_id = n
  Address.create!({state: state, addressable_id: n ,addressable_type: "Place"})
end
