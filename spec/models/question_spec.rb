require 'spec_helper'

describe Question do
  it { should validate_presence_of :text }
  it { should validate_presence_of :question_pack }
  it { should validate_presence_of :order }

  it { should ensure_inclusion_of(:order).in_range(1..5) }
  it { should validate_uniqueness_of(:order).scoped_to(:question_pack_id) }

  it { should have_one(:answer).dependent(:destroy) }
  it { should belong_to(:question_pack) }
end
