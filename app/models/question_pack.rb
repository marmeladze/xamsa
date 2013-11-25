class QuestionPack < ActiveRecord::Base
  validates_presence_of :title

  has_many :questions, dependent: :destroy
end
