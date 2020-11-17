module Inspectors

  @@errors = []

  class Base
    attr_reader :entire_code

    def initialize(code)
      @entire_code = code
      @code_by_line = code_by_line
      @tokenized_code = tokenize
      @tokenized_by_line = tokenize_by_line
      @token_handler = TokenHandler.new(@tokenized_code)
    end

    private

    def code_by_line
      @entire_code.split("\n")
    end

    def tokenize
      Ripper.lex(@entire_code)
    end

    def tokenize_by_line
      tokens = []
      @code_by_line.length.times do |index|
        tokens << Ripper.lex(@code_by_line[index])
      end
      tokens
    end
  end

  def submit_report(location, type, message)
    @@errors << [location, type, message]
  end

  def report
    @@errors.each do |error|
      location, type, message = error
      puts "Location: #{location} | Type: #{type} | Error: #{message}"
    end
  end
end
