require 'spec_helper'

describe UserAuthorizer do

  before :each do
    @admin = build(:user, :admin)
    @user = build(:user)
  end

  describe "Admins" do
    it "can delete admins" do
      expect(@admin).to be_deletable_by(@admin)
    end

    it "can delete users" do
      expect(@user).to be_deletable_by(@admin)
    end

    it "can update admins" do
      expect(@admin).to be_updatable_by(@admin)
    end

    it "can update users" do
      expect(@user).to be_updatable_by(@admin)
    end
  end

  describe "Users" do
    it "can't delete admins" do
      expect(@admin).not_to be_deletable_by(@user)
    end

    it "can't delete other users" do
      mock_user = build(:user)
      expect(@user).not_to be_deletable_by(mock_user)
    end

    it "can delete itselfs" do
      expect(@user).to be_deletable_by(@user)
    end

    it "can't update other users" do
      mock_user = build(:user)
      expect(@user).not_to be_updatable_by(mock_user)
    end

    it "can update itselfs" do
      expect(@user).to be_updatable_by(@user)
    end
  end
end