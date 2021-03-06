require 'ripper'
require 'parser/current'
require 'colorize'

require_relative 'inspectors/base'
require_relative 'inspectors/method_length'
require_relative 'inspectors/indentation_helper'
require_relative 'inspectors/indentation'
require_relative 'inspectors/naming'
require_relative 'helpers/start_inspect'
require_relative 'helpers/token_handler'
require_relative 'helpers/file_handler'
require_relative 'inspectors/maximum_line_length'
require_relative 'inspectors/trailing_white_spaces'
require_relative 'inspectors/space_around_op'
require_relative 'helpers/parser'
require_relative 'helpers/start_inspect_parser'

def start_analyzing(filename)
  code = FileHandler.new(filename).code

  source_code = ParseCode.new.parse(code)
  inspection = StartInspection.new(code)
  inspect_parsed_code = StartInspectionParser.new(source_code.ast)
  inspection.start
  inspect_parsed_code.start
  inspection.report
end
