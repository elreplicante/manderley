class UserAuthorizer < ApplicationAuthorizer
  
  def updatable_by?(user)
    user == resource || user.admin? 
  end

  def deletable_by?(user)
    user.admin?
  end
end