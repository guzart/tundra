class BasePolicy
  class Scope
    attr_reader :user, :scope

    def initialize(context, scope)
      @user = context.user
      @scope = normalize_scope(scope)
    end

    def resolve
      return scope.by_user(user) if scope.respond_to?(:by_user)
      scope.none
    end

    private

    def normalize_scope(raw_scope)
      scope = raw_scope.last if raw_scope.is_a?(Array)
      scope
    end
  end

  attr_reader :user, :record

  def initialize(context, record)
    @user = context.user
    @record = record
  end
end
