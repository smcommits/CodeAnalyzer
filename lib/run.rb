require 'ripper'
require 'parser/current'

require_relative 'helpers/processor'
require_relative 'inspectors/base'
require_relative 'helpers/token_handler'
require_relative 'helpers/file_handler'
require_relative 'helpers/start_inspect'
require_relative 'inspectors/maximum_line_length'
require_relative 'inspectors/trailing_white_spaces'
require_relative 'inspectors/space_around_op'

code = FileHandler.new('/home/sa/top/linter/CodeAnalyzer/lib/testfile.rb').code
inspection = Inspectors::StartInspection.new(code)
inspection.start
inspection.report
