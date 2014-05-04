class BaseRepository
  attr_accessor :context

  def initialize (model)
    @context = Resolver.resolve model
  end

  def create (entity)
    load entity
    @context.save && @context if @context.valid?
  end

  protected

  def load (entity)
    @context.attributes = entity.to_hash
  end
end
