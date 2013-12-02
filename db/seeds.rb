# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

puts 'destroying all Question Packs...'
QuestionPack.destroy_all

puts 'adding Question Packs...'
json = ActiveSupport::JSON.decode(open(ENV["SEED_FILE_1"]).read)
json.each_with_index do |question_pack_hash, index|
  puts "#{index + 1}. #{question_pack_hash['title']}".green
  question_pack = QuestionPack.create!(title: question_pack_hash['title'])
  question_pack_hash['questions'].each do |question_hash|
    question = question_pack.questions.build(
      text:  question_hash['text'],
      order: question_hash['order']
    )
    question.save!
    question.build_answer(text: question_hash['answer']['text']).save!
  end
end
