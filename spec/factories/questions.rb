# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    text "Bakı şəhəri məhz bu dənizin sahilində yerləşir"
    question_pack
    answer
    sequence(:order, 1) { |n| n }

    trait :second do
      text "Məhz bu komanda 90-cı illərdə Azərbaycanı Şən və Hazırcavablar Klubunun Yüksək Liqasında təmsil etmişdir."
      order 2
    end

    trait :with_answer do
      text '“Əlvida, Bakı! Səni bir daha görməyəcəyəm” misraları ilə başlayan şeir bu rus şairin qələminə məxsusdur.'
      order 3
      after :create do |question|
        question.answer = create :answer, question: question, text: 'Bakı'
        question.save
      end
    end
  end
end
