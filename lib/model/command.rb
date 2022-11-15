# frozen_string_literal: true

class Command
  attr_accessor :name, :args

  def initialize(name, args = nil)
    @name = name.to_sym
    @args = args
  end

  def self.parse(command_string)
    case command_string
    when /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
      _command, x, y, direction_string = command_string.gsub(',', ' ').split
      direction = Direction.parse(direction_string)
      Command.new(:PLACE, [x, y, direction])
    when /^MOVE$/, /^LEFT$/, /^RIGHT$/, /^REPORT$/
      Command.new(command_string)
    else
      raise 'Invalid Command'
    end
  end
end
