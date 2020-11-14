module Inspectors

class StartInspection < Base
  def initialize(code)
    super
    @code = code
    @inspectors = [MaximumLineLengthChecker.new(@code), 
                   TrailingWhiteSpaces.new(@code),
                   SpaceAroundOperators.new(@code)
    ]
  end

  def start
    @inspectors.each do |inspector|
      inspector.inspect
    end
  end
end
end
