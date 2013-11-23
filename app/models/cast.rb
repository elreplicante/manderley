  class Cast < ActiveRecord::Base
  belongs_to :movie
  belongs_to :person
  validates :movie_id, :uniqueness => { :scope => [:person_id, :role] }
  ROLE = ['actor', 'director', 'technician'].sort
end
