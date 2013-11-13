class Cast < ActiveRecord::Base
  has_many :movie
  has_many :person
end
