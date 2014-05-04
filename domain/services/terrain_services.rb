class TerrainServices < BaseServices
  def create (terrain)
    @repository.create(terrain)
  end
end
