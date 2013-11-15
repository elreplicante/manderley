class Movie < ActiveRecord::Base
  has_many :comments , dependent: :destroy
  has_many :casts, dependent: :destroy
  has_many :people, through: :casts

  validates_presence_of :title, :year, :duration

  scope :short, -> { where('duration < ?', 60) }
  scope :longer_that, ->(duration) {  where('duration > ?',duration) }
  scope :nineties, -> { where('? < year < ?', 1989, 2000) }
  scope :modern, -> { where('year > ?', 2000) }
  scope :gorgeous, -> { self.modern.long }
end
