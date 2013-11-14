class Cast < ActiveRecord::Base
  belongs_to :movie
  belongs_to :person

  ROLE = ['actor', 'director', 'technician'].sort
end
