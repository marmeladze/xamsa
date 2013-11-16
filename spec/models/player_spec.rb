require 'spec_helper'

describe Player do
  describe "validations" do
    describe "of presence" do
      [:email, :full_name, :password, :birthday, :sex].each do |attr|
        it { should validate_presence_of(attr) }
      end
    end

    describe "of uniqueness" do
      it { should validate_uniqueness_of(:email) }
    end

    describe "of acceptance" do
      it { should validate_acceptance_of :terms_of_service }
    end
  end
end