class Comment < ActiveRecord::Base
  belongs_to :movie
  
  validates_presence_of  :body, :movie
  validates_length_of :body, maximum: 500
end
