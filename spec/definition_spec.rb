require('rspec')
require('definition')

describe(Definition) do
  describe('#definition') do
    it('returns a definition that is entered') do
      test_definition = Definition.new("Fear of the number 10")
      expect(test_definition.definition).to(eq("Fear of the number 10"))
    end
  end
end
