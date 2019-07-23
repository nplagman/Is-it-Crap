class Ability
  include CanCan::Ability



  def initialize(user)


#   user ||= User.new # guest user (not logged in)
#   can :read
#
#   can [:create, :update, :destroy], Product do |product|
#     product.user == user
#
#     can :manage, :all if user.role == "admin"
#   end
# end
    # Define abilities for the passed in user here. For example:

      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        can :access, :rails_admin
        
      else
        can :read, :all 
        
      end


  end
end
