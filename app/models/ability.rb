# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
  # Define abilities for the passed in user here. For example:
    #
    
        can :manage, :all
  end
end
