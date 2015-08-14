class Definition
  attr_reader(:definition, :id)

  @@definitions = []

  define_method(:initialize) do |definition|
    @definition = definition
    @id = @@definitions.length
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
end
