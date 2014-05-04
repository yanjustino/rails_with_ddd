class Modules
  protected

  def self.modules (dependecy)
    case dependecy.name
    when 'Terrain' then Terrain.new
    when 'TerrainRepository' then TerrainRepository.new Terrain
    when 'TerrainServices' then TerrainServices.new modules TerrainRepository
    else nil end
  end
end
