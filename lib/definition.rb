class Definition
  attr_reader(:definition, :id)

  @@definitions = []

  define_method(:initialize) do |definition|
    @definition = definition
    @id = @@definitions.length + 1
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_method(:delete) do
    @@definitions.delete(self)
  end

  define_singleton_method(:find) do |id_number|
    @@definitions.each do |definition|
      if definition.id == id_number.to_i
        return definition
      end
    end
  end
end
