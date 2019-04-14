# frozen_string_literal: true

class Ability
  include CanCan::Ability

  
    def initialize(user)
   
           user ||= AdminUser.new # guest user (not logged in)
     
        case user.categoria # a_variable is the variable we want to compare
           when 1
              can :manage, :all
            when 2 #roy
              can :manage, :all
              can [:read,:update],  [AdminUser]
              can :read, ActiveAdmin::Page, :name =>"Dashboard"
            # can :read, ActiveAdmin::Page, :name =>"Dpc"
            # can [:create,:read,:update,:destroy], [Phase,Activity,Piece]
      
            when 3 #adm por defecto
              can :manage, :all


        end

    end
end
