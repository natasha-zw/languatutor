# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.has_role?(:admin)
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    create?
  end

  def dashboard? 
    user.has_role?(:admin)
  end 
  def export? 
    user.has_role?(:admin)
  end
  
  def history?
    show?
  end

  def show_in_app?
    show?
  end

  def export?
    show?
  end



  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
