class Definition
  attr_reader(:definition)

  @@definitions = []

  define_method(:initialize) do |definition|
    @definition = definition
  end

  define_singleton_method(:all) do
    @@definitions
  end
end
