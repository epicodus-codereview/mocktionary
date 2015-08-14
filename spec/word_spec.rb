require('rspec')
require('word')

describe(Word) do
  describe('#word') do
    it('returns the word that is entered') do
      test_word_list = Word.new("Yo")
      expect(test_word_list.word()).to(eq("Yo"))
    end
  end

end
