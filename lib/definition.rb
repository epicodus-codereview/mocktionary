class Definition
  attr_reader(:definition)
  attr_accessor(:id)

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

  define_method(:remove) do
    @@definitions.delete(self)

    index = 1
    @@definitions.each do |definition|
      definition.id = index
      index = index + 1
    end
  end

  define_singleton_method(:find) do |id_number|
    @@definitions.each do |definition|
      if definition.id == id_number.to_i
        return definition
      end
    end
  end
end
