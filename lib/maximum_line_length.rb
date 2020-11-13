module Lint

class MaximumLineLength < BasicLint
    @@error_type = 'Format/Line_Length' 
    @@message = 'Length of the line is too long'
      
    def initialize(code)
      @code_by_line = code
    end

    def check
      @code_by_line.each_with_index do |line, index|
        if line.length > 80
         @@errors << ["Line: #{index + 1}" , @@error_type, @@message] 
        end
      end
    end
 end
end
