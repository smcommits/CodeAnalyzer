class TrailingWhiteSpaces < Inspectors::Base
  include Inspectors
  def initialize(code)
    super
    @error_type = 'Format/TrailingWhitespaces'
    @message = 'Trailing white spaces detected'
  end

  def inspect
    @tokenized_by_line.length.times do |line|
      token = TokenHandler.new(@tokenized_by_line[line])
      submit_report("#{line + 1}:#{token.column(-1) + 1}", @error_type, @message) if token.type(-1) == :on_sp
    end
  end
end
