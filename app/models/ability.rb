# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # Guest user
    
    
    return unless user.present?
    if user.roles.exists?(name: "creator")
      can :creatordash, :dashboard
      can :user_permissions, :dashboard
      can :index, :home

      can :manage, CasestudyUser
      can :manage, Casestudy
      can :manage, Page
      can :manage, Question
      

    elsif user.roles.exists?(name: "assesor")
      can :assessordash, :dashboard
      can :index, :home
      can :show, Casestudy, :user_id => user.id

    elsif user.roles.exists?(name: "student")
      can :userdash, :dashboard
      can :index, :home
      can :show, CasestudyUser, :user_id => user.id
      can :show, Casestudy, :user_id => user.id

    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
