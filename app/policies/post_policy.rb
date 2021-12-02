class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.order(created_at: :desc)
    end
  end

  def create?
    true
  end

  def show?
    true
  end
end
