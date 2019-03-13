# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'When set and save place, caliculate and save latitude and longitude' do
    user1 = User.new(
      name: 'user1',
      place: 'Miami',
      email: 'user1@example.com',
      password: 'password'
    )
    user1.save
    expect(user1.latitude).to eq 25.7742658
    expect(user1.longitude).to eq -80.1936589
  end

  it 'After create user, auto set default image' do
    user1 = User.new(
      name: 'user1',
      place: 'Miami',
      email: 'user1@example.com',
      password: 'password'
    )
    user1.save
    expect(user1.asset.image.present?).to be true
  end

  it 'User image present now & update with no image, auto set default image' do
    user1 = User.create(
      name: 'user1',
      place: 'Miami',
      email: 'user1@example.com',
      password: 'password'
    )
    expect(user1.asset.image.filename).not_to eq 'test-image.png'
    image_path = File.join(Rails.root, 'spec/fixtures/test-image.png')
    user1.build_asset(image: Rack::Test::UploadedFile.new(image_path))
    user1.save
    expect(user1.asset.image.filename).to eq 'test-image.png'
  end
end
