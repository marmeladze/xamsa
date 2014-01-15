require 'spec_helper'

describe Answer do
  it { should validate_presence_of :text }

  it { should belong_to(:question) }

  describe '#check' do
    subject(:answer) { create :answer }

    it 'returns true for similar answers' do
      expect(answer.check('Baku')).to be_true
    end

    it 'returns false for non-similar answers' do
      expect(answer.check('Doha')).to be_false
    end
  end
end
