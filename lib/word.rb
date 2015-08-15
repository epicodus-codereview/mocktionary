class Word
  attr_reader(:word)
  attr_accessor(:definition, :id)

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

  define_method(:add_definition) do |definition|
    @definition.push(definition)
  end

  define_method(:delete_definition) do |definition|
    @definition.delete(definition)
  end

  define_method(:delete) do
    @@words.delete(self)

    index = 1
    @@words.each do |word|
      word.id = index
      index = index + 1
    end
  end
end
