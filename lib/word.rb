class Word
  attr_reader(:word)
  @@words = []

  define_method(:initialize) do
    @word = self
  end
end
