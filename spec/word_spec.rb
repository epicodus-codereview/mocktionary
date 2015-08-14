require('rspec')
require('word')

describe(Word) do
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
      test_word.save()
      test_word2 = Word.new("Splendiferous")
      test_word2.save()
      expect(Word.all).to(eq([test_word, test_word2]))
    end
  end
end
