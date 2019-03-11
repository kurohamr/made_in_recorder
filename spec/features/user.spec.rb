require 'rails_helper'

RSpec.feature "Registration and session", type: :feature do

  scenario 'sign up' do
    visit unauthenticated_root_path
    fill_in 'user_name', with: 'test_user1'
    fill_in 'user_email', with: 'test1@exmaple.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'アカウント登録が完了しました。'
  end

  scenario 'Sign in and sign out' do
    User.create!(name: 'test_user2', email: 'test2@example.com', password: 'password')
    visit new_user_session_path
    fill_in 'user_email', with: 'test2@example.com'
    fill_in 'user_password', with: 'password'
    click_on 'Sign in'
    expect(page).to have_content 'ログインしました。'
    click_link href: destroy_user_session_path
    expect(page).to have_content 'ログアウトしました。'
  end
end

RSpec.feature "user general", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
    post1 = Post.new(thing: "thing1", place: "London", user: @user, description: 'testtestest #testhashtag')
    image_path = File.join(Rails.root, 'spec/fixtures/test-image.png')
    post1.build_asset(image: Rack::Test::UploadedFile.new(image_path))
    post1.save
  end

  scenario 'Edit user profile with profile image' do
    visit edit_user_path(@user)
    fill_in 'user_place', with: 'Seatle'
    attach_file 'user_img', "#{Rails.root}/spec/fixtures/test-image.png"
    click_on '保存する'
    expect(page).to have_content '編集されました'
  end

  scenario 'switch second tab?' do
    visit user_path(@user)
    pending 'Can not recognize tab switching'
    expect(page).not_to have_content '#testhashtag'
    click_link href: '#tab2'
    expect(page).to have_content '#testhashtag'
  end
end
