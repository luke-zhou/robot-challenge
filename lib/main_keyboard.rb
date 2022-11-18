# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'game'
require 'logger'

logger = Logger.instance
# TODO: easy to test, turn on when submit
input_case_sensitive = true

puts 'Let us start:'
logger.info('Program starts.')

WIDTH = 5
LENGTH = 5
world = Game::World.new(WIDTH, LENGTH)
loop do
  logger.info("World Status: #{world.status}")

  input = gets.strip
  logger.info("User input: #{input}")
  input = input.upcase unless input_case_sensitive

  break if input =~ /EXIT/

  begin
    command = Game::Command.parse(input)
  rescue StandardError => e
    logger.warn(e.message)
  end

  result = world.excute(command) if command
  puts result if result
end

logger.info("Program ends.\n")
