class TerrainController < ApplicationController
  def initialize
    @service = Resolver.resolve TerrainServices
  end

  def index
    entity = TerrainEntity.new({width: 10, height: 10})

    terrain = @service.create entity
    render json: terrain.to_json
  end
end
