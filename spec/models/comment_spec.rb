require 'spec_helper'

describe Comment do
  describe "with valid attributes" do
    it "should be valid" do
      expect(build(:comment)).to be_valid
    end
  end

  describe "is invalid" do
    it "without a body" do
      expect(build(:comment, body: nil)).to_not be_valid
    end

    it "without a movie" do
      expect(build(:comment, movie: nil)).to_not be_valid
    end

    it "with an body bigger than 500 characters" do
      expect(build(:comment, body: 'h' * 501 )).to_not be_valid
    end
  end
end
