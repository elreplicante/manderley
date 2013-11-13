class Movie < ActiveRecord::Base
  has_many :comments
  has_many :casts
  has_many :people, through: :casts
  validates_presence_of :title, :year, :duration
end
