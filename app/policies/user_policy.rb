class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def rails_admin?(action)
    case action
      when :destroy, :new
        false
      else
        super
    end
  end
end
