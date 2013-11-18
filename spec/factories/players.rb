FactoryGirl.define do
  factory :player do
    full_name 'Test Player'
    birthday '30.12.1989'
    sex true
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
  end
end