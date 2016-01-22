class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
      can :index, Payola::Subscription
      can :read, :create, :update, Payola::Subscription, owner_id: user.id
    end

    # # without rolify:
    # unless user.new_record?
    #   can :index, Payola::Subscription
    #   can :read, :create, :update, Payola::Subscription, owner_id: user.id
    # end

  end
end
