#!/usr/bin/env ruby
require_relative '../lib/run'

if ARGV.size.zero? || ARGV.include?('-h')
  puts 'Usage: ./main.rb path/to/your/file'
else
  filename = File.expand_path(ARGV[0])
  start_analyzing(filename)
end
