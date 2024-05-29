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
    obj = @@serializer.parse(string)
    instance_variables.each do |var|
      instance_variable_set(var, obj[var])
    end

    obj
  end
end
