class Word
  attr_reader(:word, :id)
  @@words = []

  define_method(:initialize) do |word|
    @word = word
    @id = @@words.length + 1
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end

end
