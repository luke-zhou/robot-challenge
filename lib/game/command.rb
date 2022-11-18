# frozen_string_literal: true

module Game
  class Command
    attr_reader :name, :args

    def initialize(name, args = nil)
      @name = name.to_sym
      @args = args
    end

    def self.parse(command_string)
      case command_string
      when /^PLACE\s+-?\d+\s*,\s*-?\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
        build_place_command(command_string)
      when /^(MOVE|LEFT|RIGHT|REPORT)$/
        Game::Command.new(command_string)
      else
        raise 'Invalid Command'
      end
    end

    def self.build_place_command(command_string)
      _command, x, y, direction_string = command_string.gsub(',', ' ').split
      position = Game::Position.new(x.to_i, y.to_i)
      direction = Game::Direction.parse(direction_string)
      Game::Command.new(:PLACE, [position, direction])
    end
  end
end
