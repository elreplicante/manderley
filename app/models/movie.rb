class Movie < ActiveRecord::Base
  has_many :comments , dependent: :destroy
  has_many :casts, dependent: :destroy
  has_many :people, through: :casts

  validates_presence_of :title, :year, :duration
end
