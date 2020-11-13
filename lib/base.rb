
module Lint
  class FileHandler

    def initialize(filename)  
       @filename = filename
    end 

    def entire_code
      File.new(@filename, 'r').read
    end

    def code_by_line
      File.new(@filename, 'r').readlines
    end
  
  end

  class BasicLint  < FileHandler

    @@errors = []
    attr_reader :tokenized_code, :traversed_code, :parsed_code, :code_by_line, :entire_code

    def initialize(entire_code, code_by_line)
      @code_by_line = code_by_line
      p code_by_line
      @entire_code = entire_code
    end


    # def tokenize_code
      # Ripper.lex(@code)
    # end

   #  def parse_code
      # Parser::CurrentRuby.parse(@code)
    # end

    # def traverse_code
      # Traverse.new.process(@parsed_code)
    # end

    def report 
      @@errors.each do |error|
       location, type, message = error
       puts "Location: #{location} | Type: #{type} | Error: #{message}" 
      end
    end
  end
end
