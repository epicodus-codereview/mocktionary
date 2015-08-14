class Word
  attr_reader(:word)
  @@words = []

  define_method(:initialize) do |word|
    @word = word
  end
end
