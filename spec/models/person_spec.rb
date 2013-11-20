require 'spec_helper'

describe Person do

  describe "with valid attributes" do
    xit "should be valid" do
      expect(build(:person)).to be_valid
    end
  end
end
