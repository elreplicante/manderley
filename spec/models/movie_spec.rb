require 'spec_helper'

describe Movie do
  describe "with valid attributes" do
    it "should be valid" do
      expect(build(:movie)).to be_valid
    end
  end

  describe "is invalid" do
    it "without a title" do
      expect(build(:movie, title: nil)).to_not be_valid
    end

    it "without a year" do
      expect(build(:movie, year: nil)).to_not be_valid
    end
  
    it "without a duration" do
      expect(build(:movie, duration: nil)).to_not be_valid
    end
  end
end
