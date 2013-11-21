class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable
  has_many :movies
end
