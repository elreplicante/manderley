class PopulateFriendlySlugs < ActiveRecord::Migration
  def change
    Movie.find_each &:save
    Person.find_each &:save
    User.find_each &:save
  end
end
