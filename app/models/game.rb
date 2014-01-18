class Game < ActiveRecord::Base
  include AASM

  belongs_to :player1
  belongs_to :player2
  belongs_to :player3
  belongs_to :player4
  belongs_to :question_pack

  aasm do
    state :pending, initial: true, before_enter: :initialize_game
  end

  def initialize_game
    self.player1_score = 0
    self.player2_score = 0
    self.player3_score = 0
    self.player4_score = 0
  end
end
