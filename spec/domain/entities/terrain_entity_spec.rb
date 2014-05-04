require 'spec_helper'

describe TerrainEntity do
  context 'when passing width and height' do
    it 'returns a terrain size' do
      terrain = TerrainEntity.new
      terrain.width = 10
      terrain.height = 10

      expect(terrain.size).to eq 100
    end
  end
end
