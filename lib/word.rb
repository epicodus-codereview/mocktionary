class Word
  attr_reader(:word, :id)
  attr_accessor(:definition)

  @@words = []

  define_method(:initialize) do |word|
    @word = word
    @id = @@words.length + 1
    @definition = []
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

  define_singleton_method(:find) do |id_number|
    @@words.each do |word|
      if word.id == id_number.to_i
        return word
      end
    end
  end
end
