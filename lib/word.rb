class Word
  attr_reader(:word)
  @@words = []

  define_method(:initialize) do |word|
    @word = word
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end
end
