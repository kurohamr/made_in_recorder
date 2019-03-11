FactoryBot.define do
  factory :user do
    name { 'User1' }
    email {'user1@example.com'}
    password { 'password' }
  end

  factory :seconduser, class: User do
    name { 'User2' }
    email {'user2@example.com'}
    password { 'password' }
    latitude { 35.681236 }
    longitude { 139.767125 }
  end
end
