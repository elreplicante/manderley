class Movie < ActiveRecord::Base
  has_many :comments
  validates_presence_of :title, :year, :duration
end
