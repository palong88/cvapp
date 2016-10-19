class Ability
  include CanCan::Ability

    def initialize(user)

		   can :manage, :subscriptions if user.has_role? :admin
		   can :manage, :users if user.has_role? :admin
  	end



end
