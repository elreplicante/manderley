class Movie < ActiveRecord::Base
  has_many :comments
  has_many :people, through: :casts
  has_many :casts
  validates_presence_of :title, :year, :duration
end
