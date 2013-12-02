class Answer < ActiveRecord::Base
  validates_presence_of :text

  belongs_to :question

  def check(submitted_answer)
    similarity = $white.similarity text, submitted_answer
    similarity >= 0.6
  end
end
