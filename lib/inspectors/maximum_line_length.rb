module Inspectors
  class MaximumLineLengthChecker < Base

    def initialize(code)
      super
      @error_type = 'Format/Line_Length' 
      @message = 'Length of the line is too long'
    end

    def inspect
      @code_by_line.each_with_index do |line, index|
        @@errors << ["Line: #{index + 1}", @error_type, @message] if line.length > 80
      end
    end
  end
end
