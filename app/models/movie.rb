class Movie < ActiveRecord::Base
  has_many :comments , dependent: :destroy
  has_many :casts, dependent: :destroy
  accepts_nested_attributes_for :casts, allow_destroy: true, reject_if: :all_blank
  has_many :people, through: :casts
  belongs_to :user

  has_many :directors, -> { Cast.where(role: 'director') }, through: :casts, source: :person
  validates_presence_of :title, :year, :duration

  scope :short, -> { where('duration < ?', 60) }
  scope :longer_that, ->(duration) {  where('duration > ?', duration) }
  scope :medium, -> { longer_that 60 }
  scope :long, -> { longer_that 90 }
  scope :huge, -> { longer_that 120 }
  scope :nineties, -> { where('? < year < ?', 1989, 2000) }
  scope :modern, -> { where('year > ?', 2000) }
  scope :gorgeous, -> { self.modern.long }
  scope :last_at_least, ->(n) {  }
end
