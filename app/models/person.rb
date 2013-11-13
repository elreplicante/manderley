class Person < ActiveRecord::Base
  belongs_to :movie
  has_many :casts
  validates_presence_of :name, :surname
end
