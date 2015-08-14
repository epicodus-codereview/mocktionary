require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear
  end

  describe('#definition') do
    it('returns a definition that is entered') do
      test_def = Definition.new("Fear of the number 10")
      expect(test_def.definition).to(eq("Fear of the number 10"))
    end
  end

  describe(".all") do
    it('returns a list of definitions that is empty at first') do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a definition to the list of definitions') do
      test_def = Definition.new("Fear of the number 10")
      test_def.save
      test_def2 = Definition.new("A condition characterized by freedom from worry or any other pre-occupation of reality")
      test_def2.save
      expect(Definition.all).to(eq([test_def, test_def2]))
    end
  end

  describe('.clear') do
    it('clears the list of definitions') do
      test_def = Definition.new("Fear of the number 10")
      test_def.save
      test_def2 = Definition.new("A condition characterized by freedom from worry or any other pre-occupation of reality")
      test_def2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#delete_def') do
    it('deletes a definition from the list') do
      test_def = Definition.new("Fear of the number 10")
      test_def.save
      test_def2 = Definition.new("A condition characterized by freedom from worry or any other pre-occupation of reality")
      test_def2.save
      test_def.delete
      expect(Definition.all).to(eq([test_def2]))
    end
  end

  describe('#id') do
    it('returns the id number of a definition on the list') do
      test_def = Definition.new("Fear of the number 10")
      test_def.save
      test_def2 = Definition.new("A condition characterized by freedom from worry or any other pre-occupation of reality")
      test_def2.save
      expect(test_def.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns a definition by its id number') do
      test_def = Definition.new("Fear of the number 10")
      test_def.save
      test_def2 = Definition.new("A condition characterized by freedom from worry or any other pre-occupation of reality")
      test_def2.save
      expect(Definition.find(test_def2.id())).to(eq(test_def2))
    end
  end
end
