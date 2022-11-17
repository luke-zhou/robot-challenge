# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'model/world'
require 'logger'
require 'process'

logger = Logger.instance
# TODO: easy to test, turn on when submit
input_case_sensitive = false

puts 'Let us start:'
logger.info('Program starts.')

world = World.new(5, 5)
loop do
  logger.info("World Status: #{world.status}")

  input = gets.strip
  logger.info("User input: #{input}")
  input = input.upcase unless input_case_sensitive

  break if input =~ /EXIT/

  begin
    command = Command.parse(input)
  rescue StandardError => e
    logger.instance.error(e.message)
  end

  result = world.excute(command) if command
  puts result if result
end

logger.info("Program ends.\n")
