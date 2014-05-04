class BaseServices
  attr_accessor :repository

  def initialize (repository)
    @repository = repository unless repository.nil?
  end
end
