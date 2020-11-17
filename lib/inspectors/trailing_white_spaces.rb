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
        if token.type(-1) == :on_sp
          submit_report("Line:Column : #{line + 1}:#{token.column(-1) + 1}", @error_type, @message)
        end
      end
    end
  end
