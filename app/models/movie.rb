class Movie < ActiveRecord::Base
  has_many :comments
end
