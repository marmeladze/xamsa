# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    player1 nil
    player1_score 1
    player2 nil
    player2_score 1
    player3 nil
    player3_score 1
    player4 nil
    player4_score 1
    question_pack nil
  end
end
