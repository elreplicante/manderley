class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, :recoverable
  has_many :movies

  extend FriendlyId
  friendly_id :friendly_email, use: :slugged

  def friendly_email
    friendly_email = self.email.sub('@', 'at')
    friendly_email = friendly_email.sub('.', 'dot')
  end
end
