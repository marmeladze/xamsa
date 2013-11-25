require 'spec_helper'

describe QuestionPack do
  it { should validate_presence_of :title }

  it { should have_many(:questions).dependent(:destroy) }
end
