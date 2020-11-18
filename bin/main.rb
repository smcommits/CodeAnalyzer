#!/usr/bin/env ruby
require_relative '../lib/run'

if ARGV.size.zero? || ARGV.include?('-h')
  puts help
else
  filename = File.expand_path(ARGV[0])
  start_analyzing(filename)
end
