class MaximumLineLengthChecker < Inspectors::Base
  include Inspectors

  @error_type = 'Format/Line_Length'
  @message = 'Length of the line is too long'

  def inspect
    @code_by_line.each_with_index do |line, index|
      submit_report("Line: #{index + 1}", @error_type, @message) if line.length > 80
    end
  end
end
