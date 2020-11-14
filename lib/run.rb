require 'ripper'
require 'parser/current'
require_relative 'inspectors/base'
require_relative 'inspectors/maximum_line_length'
require_relative 'helpers/token_handler'
require_relative 'helpers/file_handler'
require_relative 'helpers/processor'
require_relative 'helpers/start_inspect'

filename = File.expand_path('testfile.rb')
code = FileHandler.new(filename).code
inspection = Inspectors::StartInspection.new(code)
inspection.start
inspection.report
