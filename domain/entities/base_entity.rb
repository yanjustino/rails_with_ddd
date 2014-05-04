class BaseEntity
  def attributes= (attributes = {})
    attributes.each do |k, v|
      self.send "#{k}=", v
    end
  end

  def to_hash
    Hash[*instance_variables.map { |v|
      [v.to_s.tr('@', '').to_sym, instance_variable_get(v)]
    }.flatten]
  end
end
