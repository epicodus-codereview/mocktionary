require('rspec')
require('word')

describe(Word) do
  describe('#word') do
    it('returns the word that is entered') do
      test_word_list = Word.new("Yo")
      expect(test_word_list.word()).to(eq("Yo"))
    end
  end

  describe('.all') do
    it('returns a list of words that is empty at first') do
      expect(Word.all).to(eq([]))
    end
  end
end
