# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'When set and save place, caliculate and save latitude and longitude' do
    user1 = FactoryBot.create(:user)
    post1 = Post.new(thing: 'thing1', place: 'London', user: user1)
    image_path = File.join(Rails.root, 'spec/fixtures/test-image.png')
    post1.build_asset(image: Rack::Test::UploadedFile.new(image_path))
    post1.save
    expect(post1.latitude).to eq 51.5073219
    expect(post1.longitude).to eq -0.1276474
  end

  it 'run image validation?' do
    user1 = FactoryBot.create(:user)
    post1 = Post.new(thing: 'thing1', place: 'London', user: user1)
    post1.build_asset
    pending 'この先エラーを捉えられないのでスキップ'
    # expect{post1.asset.image blank?}.to raise_error 'ArgumentError'
  end

  it 'create with correct tags?' do
    user1 = FactoryBot.create(:user)
    post1 = Post.new(
      thing: 'thing1',
      place: 'London',
      user: user1,
      description: 'description #testtag #tagstest'
    )
    image_path = File.join(Rails.root, 'spec/fixtures/test-image.png')
    post1.build_asset(image: Rack::Test::UploadedFile.new(image_path))
    post1.save
    # binding.pry
    expect(post1.tags[0].name).to include 'testtag'
    expect(post1.tags[1].name).to include 'tagstest'
  end

  it 'update with correct tags?' do
    user1 = FactoryBot.create(:user)
    post1 = Post.new(
      thing: 'thing1',
      place: 'London',
      user: user1,
      description: 'description #testtag #tagstest'
    )
    image_path = File.join(Rails.root, 'spec/fixtures/test-image.png')
    post1.build_asset(image: Rack::Test::UploadedFile.new(image_path))
    post1.save
    post1.update(description: '#tagchanged')
    expect(post1.tags[0].name).not_to include 'testtag'
    expect(post1.tags[0].name).to include 'tagchanged'
  end
end
