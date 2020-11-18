class SourceHandler
  attr_reader :buffer, :ast, :tokens, :diagnostics

  def initialize(buffer, ast, tokens, diagnostics, comments)
    @buffer = buffer
    @ast = ast
    @comments = comments
    @tokens = tokens
    @diagnostics = diagnostics
  end
end

class ParseCode
  def initialize_parser
    parser = Parser::CurrentRuby.new

    parser.diagnostics.all_errors_are_fatal = false
    parser.diagnostics.ignore_warnings = false

    parser
  end

  def parse(string, name = '(string)')
    source_buffer = Parser::Source::Buffer.new(name, 1)
    source_buffer.source = string

    parser = initialize_parser
    diagnostics = []
    parser.diagnostics.consumer = lambda do |diagnosed_error|
      diagnostics << diagnosed_error
    end

    begin
      ast, comments, tokens = parser.tokenize(source_buffer)
    rescue Parser::SyntaxError # rubocop:disable  Lint/SuppressedException
    end

    SourceHandler.new(source_buffer, ast, tokens, diagnostics, comments)
  end

  def parse_file(path)
    parse(File.read(path), path)
  end
end
