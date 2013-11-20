class Address < ActiveRecord::Base
  validates_presence_of :street, :number, :zipcode
  validates_length_of :street, :maximum => 150
  validates_numericality_of :zipcode
  validates_length_of :zipcode, is: 5

  attr_accessor :zipcode
  
  def calculate_distance(address)
    (zipcode.to_i - address.zipcode.to_i).abs
  end
end
