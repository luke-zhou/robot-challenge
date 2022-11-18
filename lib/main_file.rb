# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'game'
require 'yaml'

def load_data
  ::YAML.load_file(ARGV[0])
rescue Errno::ENOENT
  msg = "Error to load input file: #{ARGV[0]}"
  logger.error(msg)
  puts msg
  exit
end

def test_result(name, expected, actual)
  if expected == actual
    logger.info('Test Passed.')
    puts("Test(#{name}) passed.")
  else
    logger.error('Test Failed.')
    logger.error("Expected: #{expected}")
    logger.error("Actual:   #{actual}")
    puts("Test(#{name}) failed. ")
    puts("Test(#{name}) Expected: #{expected}")
    puts("Test(#{name}) Actual:   #{actual}")
  end
end

test_data = load_data

test_data.each do |test, data|
  logger.info("Program starts for #{test}")
  logger.info("Description: #{data['Description']}")

  world = Game::World.new(data['Length'], data['Width'])
  expected = data['Results'] || []
  compare_result = data['CompareResult']
  actual = []

  data['Actions'].each do |a|
    # logger.info("World Status: #{world.status}")
    input = a.strip.upcase
    break if input =~ /EXIT/

    begin
      command = Game::Command.parse(input)
    rescue StandardError => e
      logger.warn(e.message)
    end

    result = world.excute(command) if command
    actual << result if result
  end

  test_result(test, expected, actual) if compare_result

  logger.info("Program ends for #{test}\n")
end
