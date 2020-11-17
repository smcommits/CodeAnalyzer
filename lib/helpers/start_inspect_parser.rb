class StartInspectionParser
    include Inspectors
    def initialize(parsed_code)
      @inspectors_using_parser = [Indentation.new]
      @parsed_code = parsed_code
    end

    def start
      @inspectors_using_parser.each do |inspector|
        inspector.process(@parsed_code)
      end
    end
  end

