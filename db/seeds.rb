require 'faker'
require 'open-uri'

def routing(
  user_limit=100,
  post_limit=100,
  asset_limit=100,
  tag_limit=11) #画像数に合わせる
  generate_tag(tag_limit)
  generate_user(user_limit)
  generate_post(post_limit, user_limit)
  generate_asset(asset_limit, user_limit, post_limit)
end

def generate_user(limit=100)
  limit.times do |n|
    User.create!(
      name: Faker::Football.player,
      email: Faker::Internet.email,
      password: "password",
      place: Faker::Nation.capital_city,
      introduction: Faker::Food.description,
      latitude: 35.681236,
      longitude: 139.767125
    )
  end
end

def generate_post(limit=100, users_limit=100)
  limit.times do |n|
    Post.create!(
      user_id: [1 .. user_limit].sample,
      thing: Faker::Food.dish,
      description: Faker::Food.description,
      place: Faker::Nation.capital_city,
      latitude: 35.681236,
      longitude: 139.767125
    )
  end
end

def generate_image(limit=100)
  base_url = "https://raw.githubusercontent.com/legopo/made_in_recorder/%2338/db/seed_file/test"
  extend_name = ".jpg"
  files = []
  limit.times do |n|
    files.push(open(base_url + (n % 12) + extend_name))
  end
end

def generate_asset(limit=100, user_limit=100, post_limit=100)
  images = generate_image(limit)
  limit.times do |n|
    #偶数はpost 機数はuser
    type = n.even? ? "Post" : "User"
    f_id = n.even? ? [1 .. post_limit].sample : [1 .. user_limit]
    generate_post_tag(f_id, (n % 12) + 1) if n.even?
    Asset.create!(
      image: images[n],
      assetable_type: type,
      assetable_id: f_id
    )
  end
end

def generate_tag(limit=11) #画像の種類数
  limit.times do |n|
    name = ""
    case n + 1
      when 1
        name = "#orslow"
      when 2
        name = "#orslow"
      when 3
        name = "#velvasheen"
      when 4
        name = "#saintjames"
      when 5
        name = "#saintjames"
      when 6
        name = "#alden"
      when 7
        name = "#moscot"
      when 8
        name = "#iwc"
      when 9
        name = "#nomos"
      when 10
        name = "#aesop"
      when 11
        name = "#velvasheen"
    end
    Tag.create!(
      name: name
    )
  end
end

def generate_post_tag(post_id, tag_id)
  Post_tag(
    post_id: post_id,
    tag_id: tag_id
  )
end
