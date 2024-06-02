module Serializable
  @@serializer = YAML

  def serialize
    obj = {}
    instance_variables.each do |var|
      obj[var] = instance_variable_get(var)
    end

    @@serializer.dump(obj)
  end

  def unserialize(string)
    obj = @@serializer.load(string, permitted_classes: [Symbol, Player, Computer])
    obj.keys.each do |var|
      instance_variable_set(var, obj[var])
    end

    self
  end
end
