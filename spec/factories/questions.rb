# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    text "Bakı şəhəri məhz bu dənizin sahilində yerləşir"
    question_pack
    sequence(:order, 1) { |n| n }

    trait :second do
      text "Məhz bu komanda 90-cı illərdə Azərbaycanı Şən və Hazırcavablar Klubunun Yüksək Liqasında təmsil etmişdir."
    end
  end
end
