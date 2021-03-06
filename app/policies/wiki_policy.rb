class WikiPolicy < ApplicationPolicy

  def owned
    wiki.user_id == user.id
  end

  def index?
    user.present?
  end

  def show?
    scope.where(:id => wiki.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || owned
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      elsif user.role == 'premium'
        scope.eager_load(:collaborators).where("wikis.private = ? OR wikis.user_id = ? OR collaborators.user_id = ?", false, @user.id, @user.id)
      else
        scope.eager_load(:collaborators).where("wikis.private = ? OR collaborators.user_id = ?", false, @user.id)
      end
    end
  end
end
