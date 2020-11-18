require_relative 'run'

describe Indentation do
  let(:code) { "def add(x,y)\nx+y" }
  let(:checker) { Indentation.new }
  let(:processed) { checker.process(code) }
  describe '.message' do
    it 'returns an error message if indentation is not correect' do
      expect(checker.message).to eql('Please use indentation of exactly two spaces')
    end
  end

  describe '#.type' do
    it 'returns the type of error if indentation is not correct' do
      expect(checker.error_type).to eql('Style/IncorrectIndentation')
    end
  end
end

describe MethodLength do
  let(:code) { "def add(x,y)\nx+y\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nend" }
  let(:checker) { MethodLength.new }
  let(:processed) { checker.process(code) }
  describe '.type' do
    it 'returns an error message if indentation is not correect' do
      expect(checker.error_type).to eql('Complexity/MethodLength')
    end
  end
end

describe MaximumLineLengthChecker do
  let(:code) { "def add(x,y)\nx+yf" }
  let(:checker) { MaximumLineLengthChecker.new(code) }
  describe '.message' do
    it 'returns an error message only if any line of the code is too long' do
      expect(checker.message).to eql(nil)
    end
  end

  describe '#.type' do
    it 'returns the type of error if indentation is not correct' do
      expect(checker.error_type).to eql(nil)
    end
  end
end
