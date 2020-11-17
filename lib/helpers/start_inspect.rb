class StartInspection < Inspectors::Base
  include Inspectors 
  def initialize(code)
      super
      @code = code
      @inspectors_using_token = [MaximumLineLengthChecker.new(@code),
                                 TrailingWhiteSpaces.new(@code),
                                 SpaceAroundOperators.new(@code)
                                ]

    end

    def start
      @inspectors_using_token.each do |inspector|
        inspector.inspect
      end

    end
  end
