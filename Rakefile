# frozen_string_literal: true

require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'optparse'

RSpec::Core::RakeTask.new(:test)

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'spec/**/*.rb']
  task.fail_on_error = false
end

task default: %w[lint test]

task :run, [:file] do |t, args|
  options = {}
  opts = OptionParser.new
  opts.banner = "Usage: rake run [file]"
  opts.on("-f", "--file ARG", String) { |file| options[:file] = file }
  args = opts.order!(ARGV) {}
  opts.parse!(args)

  if options[:file]
    task options[:file] do ; end 
    ruby "lib/main_file.rb #{options[:file]}"
  else
    ruby 'lib/main_keyboard.rb'
  end
end