require('rspec')
require('word')

describe(Word) do
  describe('#word') do
    it('returns the word that is entered') do
      test_word = Word.new()
      expect(test_word.word()).to(eq(test_word))
    end
  end
end
