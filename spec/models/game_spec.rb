require 'spec_helper'

describe Game do
  describe "aasm states" do
    context 'when game is initiated' do
      subject { create :game }

      its(:aasm_state) { should eql 'pending' }
      
      its(:player1_id)    { should be_nil }
      its(:player1_score) { should eql 0 }
      its(:player2_id)    { should be_nil }
      its(:player2_score) { should eql 0 }
      its(:player3_id)    { should be_nil }
      its(:player3_score) { should eql 0 }
      its(:player4_id)    { should be_nil }
      its(:player4_score) { should eql 0 }
    end
  end
end
