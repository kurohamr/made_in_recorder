require 'faker'
require 'open-uri'

class Seeder

 def initialize(
   user_limit=5,
   post_limit=100,
   image_limit=12
 )
   @images = self.open_image(image_limit)
   @user_limit=user_limit
   @post_limit=post_limit
   @image_limit=image_limit
 end

 # def info(str)
 #   info = ""
 #   info += "------------------------------------------------------------------"
 #   info += "\n"
 #   info += "******************************************************************"
 #   info += "\n"
 #   info += "                            #{str}                                "
 #   info += "\n"
 #   info += "                       user_limit: #{@user_limit}                   "
 #   info += "\n"
 #   info += "                       post_limit: #{@post_limit}                   "
 #   info += "\n"
 #   info += "                       image_limit: #{@image_limit}                 "
 #   info += "\n"
 #   info += "                       asset_limit: #{@user_limit + @post_limit}                 "
 #   info += "\n"
 #   info += "                       tag_limit: #{@image_limit}                   "
 #   info += "\n"
 #   info += "******************************************************************"
 #   info += "\n"
 #   info += "------------------------------------------------------------------"
 #   info += "\n"
 #
 #   puts(info)
 # end

 def run
   # begin
     # self.info("Start")
     self.generate_tag(@image_limit)
     self.generate_user(@user_limit)
     self.generate_post(@post_limit, @user_limit)
     # self.info("Success")
   # rescue e
   #   self.info("Fail because: #{e} ")
   # end
 end

 # private

 def generate_user(limit=100)
   limit.times do |n|
     user = User.new(
       name: Faker::Football.player,
       email: Faker::Internet.email,
       password: "password",
       place: Faker::Nation.capital_city,
       introduction: Faker::Food.description,
       latitude: 35.681236,
       longitude: 139.767125
     )
     user.build_asset() #user のimageはここでsetできる。今の所defaltのnoimage画像がセットされる
     user.save!
   end
 end

 def generate_post(limit=100, user_limit=100)
   random = Random.new
   limit.times do |n|
     id = n + 1
     post = Post.new(
       user_id: random.rand(1..user_limit),
       thing: Faker::Food.dish,
       description: Faker::Food.description,
       place: Faker::Nation.capital_city,
       latitude: 35.681236,
       longitude: 139.767125
     )
     post.build_asset(image: @images[id % 12])
     post.save!
     self.generate_post_tag(n + 1, (id % 12) + 1)
   end
 end

 def generate_post_tag(post_id, tag_id)
   PostTag.create!(
     post_id: post_id,
     tag_id: tag_id
   )
 end

 def generate_tag(limit=12) #画像の種類数
   raise “the number of tag limit is more than the number of existing images ” if limit > 12 # Dir.open(Rails.root.join(‘db’, ‘seed_file’)).length
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
         name = "#iwc"
       when 10
         name = "#nomos"
       when 11
         name = "#aesop"
       when 12
         name = "#velvasheen"
     end
     Tag.create!(
       name: name
     )
   end
 end

 def open_image(limit=12)
   raise "the number of Image limit is more than the number of existing images " if limit > 12 # Dir.open(Rails.root.join(‘db’, ‘seed_file’)).length
   base_url = "https://raw.githubusercontent.com/legopo/made_in_recorder/%2338/db/seed_file/test"
   extend_name = ".jpg"
   files = []
   limit.times do |n|
files.push(open(base_url + (n % 12).to_s + extend_name))
   end
   return files
 end
end

Seeder.new(
 5,
 100,
 12
).run()
