require 'run'

# Parser

describe ParseCode do
  let(:parsed) { ParseCode.new }
  let(:code) { "def add(x,y)\n x+y\nend" }

  describe '#initialize' do
    it 'initializes the new instance of ParseCode' do
      parser = ParseCode.new
      expect(parser.class).to eql(ParseCode)
    end
  end

  describe '#parse' do
    it 'returs the instance of source handler class which makes it is to handler the parsed code' do
      expect(ParseCode.new.parse(code).class).to eql(SourceHandler)
    end
  end
end

describe SourceHandler do
  let(:code) { "def add(x,y)\n x+y\nend" }
  let(:code_with_error) { "def add(x,y)\n x+y" }
  let(:instance) { ParseCode.new.parse(code) }
  let(:instance_with_error) { ParseCode.new.parse(code_with_error) }

  describe '#.buffer' do
    it 'returns the buffer of parsed code' do
      expect(instance.buffer.class).to eql(Parser::Source::Buffer)
    end
  end

  describe '#.ast' do
    it 'returns the AST of the code' do
      expect(instance.ast.class).to eql(Parser::AST::Node)
    end
  end

  describe '#diagnostics' do
    it 'returns the error diagnostics of the code in  an array' do
      expect(instance_with_error.diagnostics[0].render).to eql(['(string):2:5: error: unexpected token $end',
                                                                '(string):2:  x+y', '(string):2:     '])
    end
  end
end
