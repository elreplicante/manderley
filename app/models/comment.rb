class Comment < ActiveRecord::Base
  belongs_to :movie
  validates :body, presence: true, length: { maximum: 1000 }
  validates :movie, presence: true
end
