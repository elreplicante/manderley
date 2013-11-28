require 'spec_helper'

describe Person do

  describe "with valid attributes" do
    it "should be valid" do
      expect(build(:person)).to be_valid
    end
  end

  describe "is invalid" do
    xit "without a name" do
      expect(build(:person, name: nil)).to_not be_valid
    end

    xit "without a year" do
      expect(build(:person, surname: nil)).to_not be_valid
    end
  end
end
