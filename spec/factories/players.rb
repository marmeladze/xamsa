FactoryGirl.define do
  factory :player do
    full_name 'Test Player'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
  end
end