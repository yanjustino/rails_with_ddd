class TerrainEntity < BaseEntity
  attr_accessor :width, :height,
                :street, :number, :district, :city, :state, :zip_code,
                :state, :value, :quota, :number_quote,
                :type, :condominium_tax, :condominium, :iptu, :public_documentation,
                :private_documentation, :other_documentation, :terms_documentation,
                :observation

  def size
    @width * @height
  end
end
