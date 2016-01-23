class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
      can [:new, :create], Payola::Subscription, owner_id: user.id
      can :index, Plan
    end

    # # without rolify:
    # unless user.new_record?
    #  can [:new, :create], Payola::Subscription, owner_id: user.id
    #  can :index, Plan
    # end

  end
end
