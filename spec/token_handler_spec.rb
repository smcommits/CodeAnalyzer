require 'run'

describe TokenHandler do
  let(:tokens) { Ripper.lex('x = 1 + 2') }
  let(:token_handler) { TokenHandler.new(tokens) }

  describe 'token' do
    it 'returns the value of the token at a particular index' do
      expect(token_handler.token(0)).to eql('x')
    end
  end

  describe 'type' do
    it 'returns the type of the token at a particular index' do
      expect(token_handler.type(2)).to eql(:on_op)
    end
  end

  describe 'line' do
    it 'returns the line number of the token at a particular index' do
      expect(token_handler.line(2)).to eql(1)
    end
  end

  describe 'column' do
    it 'returns column number of the token at a particular index' do
      expect(token_handler.column(2)).to eql(2)
    end
  end

end
