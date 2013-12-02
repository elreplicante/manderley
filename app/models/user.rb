class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, :recoverable
  has_many :movies

  extend FriendlyId
  friendly_id :email, use: :slugged
end
