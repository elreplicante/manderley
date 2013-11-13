class Person < ActiveRecord::Base
  belongs_to :movie
  
  validates_presence_of :name, :surname
end
