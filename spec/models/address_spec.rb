require 'spec_helper'

describe Address do
  
  describe "with valid attributes" do
    it "should be valid" do
      expect(build(:address)).to be_valid
    end
  end

  describe "is invalid" do
    it "without a street" do
      expect(build(:address, street: nil)).to_not be_valid
    end

    it "without a number" do
      expect(build(:address, number: nil)).to_not be_valid
    end

    it "without a zipcode" do
      expect(build(:address, zipcode: nil)).to_not be_valid
    end

    it "with an address bigger than 150 characters" do
      expect(build(:address, street: 'h' * 152 )).to_not be_valid
    end

    context "with zipcode" do
      it "bigger than 5 characters" do
        expect(build(:address, zipcode: "ABCDEFGH" )).to_not be_valid
      end

      it "with excactly 5 characters but including any number" do
        expect(build(:address, zipcode: "A1BCD")).to_not be_valid
      end
    end
  end

  it "calculates distance between addresses" do
    my_address = create(:address, zipcode: "10000")
    your_address = create(:address, zipcode: "10001")
    expect(my_address.calculate_distance(your_address)).to eq 1
  end
end
