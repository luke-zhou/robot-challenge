# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'model/world'

require 'logger'

logger = Logger.instance

begin
  file_name = ARGV[0]
  test_data = YAML.load_file(file_name)
rescue Errno::ENOENT
  logger.error("Error to load input file: #{file_name}")
  return
end

test_data.each do |test, data|
  logger.info("Program starts for #{test}")
  logger.info(data['Description'])

  world = World.new(data['Length'], data['Width'])
  expected = data['Results'] ? data['Results'] : []
  actual = []

  data['Actions'].each do |a|
    # logger.info("World Status: #{world.status}")
    input = a.strip.upcase
    break if input =~ /EXIT/

    begin
      command = Command.parse(input)
    rescue StandardError => e
      logger.error(e.message)
    end

    result = world.excute(command) if command
    actual << result if result
  end
  if expected == actual
    logger.info('Test Passed.')
  else
    logger.error('Test Failed.')
    logger.error("Expected: #{expected}")
    logger.error("Actual:   #{actual}")
  end
  logger.info("Program ends for #{test}\n")
end
