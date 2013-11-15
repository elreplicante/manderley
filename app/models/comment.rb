class Comment < ActiveRecord::Base
  belongs_to :movie, counter_cache: true
  
  validates_presence_of  :body, :movie
  validates_length_of :body, maximum: 500
end
