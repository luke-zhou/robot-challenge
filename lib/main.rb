# frozen_string_literal: true
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'model/world'


require 'logging'

Logging.logger.root.appenders = Logging.appenders.file('robot-challenge.log')
Logging.logger.root.level = :debug

world = World.new(5, 5)
logger = Logging.logger['Main']
puts 'Let us start:'
logger.info("Program started.")
loop do
  logger.info("World Status: #{world.status}")
  input = gets.strip
  logger.info("User input: #{input}")
  begin
    command = Command.parse(input)
  rescue StandardError => e
    logger.error(e.message)
  end
  result = world.excute(command) if command
  puts result if result
end

# multi_commands_test
