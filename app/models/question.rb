class Question < ActiveRecord::Base
  validates_presence_of :text
  validates_presence_of :order
  validates_presence_of :question_pack

  validates_inclusion_of :order, in: 1..5
  validates_uniqueness_of :order, scope: :question_pack_id

  belongs_to :question_pack
  has_one :answer, dependent: :destroy
end
