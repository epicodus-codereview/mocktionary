require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear
  end

  describe('#word') do
    it('returns the word that is entered') do
      test_word = Word.new("Yo")
      expect(test_word.word()).to(eq("Yo"))
    end
  end

  describe('.all') do
    it('returns a list of words that is empty at first') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a word to the word list') do
      test_word = Word.new("Yo")
      test_word.save
      test_word2 = Word.new("Splendiferous")
      test_word2.save
      expect(Word.all).to(eq([test_word, test_word2]))
    end
  end

  describe('.clear') do
    it('clears the word list') do
      test_word = Word.new("Yo")
      test_word.save
      test_word2 = Word.new("Splendiferous")
      test_word2.save
      Word.clear
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id number of a word on the list') do
      test_word = Word.new("Yo")
      test_word.save
      test_word2 = Word.new("Splendiferous")
      test_word2.save
      expect(test_word2.id()).to(eq(2))
    end
  end

  describe('.find') do
    it('returns a word by its id number') do
      test_word = Word.new("Yo")
      test_word.save
      test_word2 = Word.new("Splendiferous")
      test_word2.save
      expect(Word.find(test_word2.id())).to(eq(test_word2))
    end
  end

  describe('#definition') do
    it('returns empty definition initially') do
      test_word = Word.new("Ataraxia")
      test_word.save
      expect(test_word.definition).to(eq([]))
    end
  end

  describe('#add_definition') do
    it('adds definition to a word') do
      test_word = Word.new("Ataraxia")
      test_word.save
      test_def = Definition.new("A condition characterized by freedom from worry or any other pre-occupation of reality.")
      test_def.save
      test_word.add_definition(test_def)
      expect(test_word.definition).to(eq([test_def]))
    end
  end
end
