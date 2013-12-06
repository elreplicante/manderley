class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable, :recoverable
  has_many :movies
  extend FriendlyId
  friendly_id :friendly_email, use: :slugged

  include Authority::UserAbilities
  include Authority::Abilities

  def friendly_email
    friendly_email = self.email.sub('@', ' at ')
    friendly_email = friendly_email.sub('.', ' dot ')
  end

  def admin
    self.has_role? :admin
  end
  alias_method :admin?, :admin

  def admin= value
    if value == "1"
      self.add_role :admin
    else
      self.remove_role :admin
    end
  end
end
