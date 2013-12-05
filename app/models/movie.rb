class Movie < ActiveRecord::Base
  
  class << self
    def role_relation role
      has_many role.pluralize.to_sym, 
        -> { where(casts: { role: role }) }, through: :casts, source: :person
    end
  end

  Cast::ROLE.each { |role| role_relation role }

  serialize :categories

  has_many :comments , dependent: :destroy
  has_many :casts, dependent: :destroy
  accepts_nested_attributes_for :casts, allow_destroy: true, reject_if: :all_blank
  has_many :people, through: :casts
  belongs_to :user

  validates_presence_of :title, :year, :duration
  

  mount_uploader :poster, PosterUploader
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :short, -> { where('duration < ?', 60) }
  scope :longer_that, ->(duration) {  where('duration > ?', duration) }
  scope :medium, -> { longer_that 60 }
  scope :long, -> { longer_that 90 }
  scope :huge, -> { longer_that 120 }
  scope :nineties, -> { where('? < year < ?', 1989, 2000) }
  scope :modern, -> { where('year > ?', 2000) }
  scope :gorgeous, -> { self.modern.long }
  scope :last_at_least, ->(n) {  }
  scope :last_weeks, -> { where('created_at > ?', 1.week.ago) }
  scope :directed_by, ->(person){ joins(:casts).where(casts: {role: 'director', person: person}) }

  before_save :reject_categories

  CATEGORIES = [:romance, :scifi, :action]

  def reject_categories
    self.categories = (self.categories || []).find_all { |x| x.present? }
  end
end
