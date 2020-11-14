module Inspectors

class StartInspection < Base
  def initialize(code)
    super
    @code = code
    @inspectors = [MaximumLineLengthChecker.new(@code)]
  end

  def start
    @inspectors.each do |inspector|
      inspector.inspect
    end
  end
end
end
