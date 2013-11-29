# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'destroying all Question Packs...'
QuestionPack.destroy_all

puts 'adding Question Packs...'
json = ActiveSupport::JSON.decode(File.read('db/seeds/acilis_oyun.json'))
json.each do |question_pack_hash|
  question_pack = QuestionPack.create!(title: question_pack_hash['title'])
  question_pack_hash['questions'].each do |question_hash|
    question_pack.questions.build(
      text:  question_hash['text'],
      order: question_hash['order']
    ).save!
  end
end
