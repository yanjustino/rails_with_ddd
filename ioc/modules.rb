class Modules
  protected

  def self.modules (dependecy)
    case dependecy.name
    when 'TerrainServices' then TerrainServices.new modules(TerrainRepository)
    when 'TerrainRepository' then TerrainRepository.new(Terrain)
    else nil end
  end
end
