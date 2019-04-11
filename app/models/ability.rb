# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
  # Define abilities for the passed in user here. For example:
    #
    user ||= AdminUser.new 
    
      case user.categoria 
          when 1,0
              can :manage, :all
          when 2 
           
            can :read, ActiveAdmin::Page, :name =>"Dashboard"
            can [:create,:read,:update,:destroy], [Product]
          else 
            can :read, ActiveAdmin::Page, :name =>"Dashboard"
       end        
              
  end
end
