class ChatroomPolicy < ApplicationPolicy
  def show?
    record.users.include?(user)
  end

  def create?
    record.users.include?(user)
  end

  class Scope < Scope
    def resolve
      scope.where("user1_id = ? OR user2_id = ?", user.id, user.id)
    end
  end
end
