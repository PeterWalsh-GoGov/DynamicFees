# frozen_string_literal: true

require 'optparse'
require 'json'

require_relative '../lib/condition/statements//statement'

Options = Struct.new(:path)
options = Options.new

OptionParser.new do |opts|
  opts.banner = 'Parses a condition object from JSON'

  opts.on('-pPATH', '--path=PATH', 'The path to the file with the condition JSON') do |path|
    options.path = path
  end

  opts.on('-h', '--help', 'Prints this help') do
    puts opts
    exit
  end

end.parse!

path = options.path

file = File.read(path)
json = JSON.parse(file)
statement = Statement.from_h(json)
puts statement




