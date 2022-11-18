# frozen_string_literal: true

require 'logger'

module Game
  class World
    attr_reader :robot

    def initialize(length, width)
      @length = length
      @width = width
      @robot = Robot.new
    end

    def status
      @robot.placed? ? @robot.report : 'Not Yet Placed'
    end

    def excute(command)
      Logger.instance.info "excute #{command.name}"
      case command.name
      when :PLACE
        place_robot(command)
      when :MOVE
        robot_move
      when :LEFT
        @robot.turn_left
      when :RIGHT
        @robot.turn_right
      when :REPORT
        result = @robot.report
      end

      return result if result
    end

    def position_is_valid?(position)
      x_valid = position.x >= 0 && position.x < @length
      y_valid = position.y >= 0 && position.y < @width
      x_valid && y_valid
    end

    def place_robot(place_command)
      if position_is_valid?(place_command.args[0])
        @robot.put_in(*place_command.args)
      else
        Logger.instance.warn("Fail to place robot on #{place_command.args[0]}")
      end
    end

    def robot_move
      return unless @robot.placed?

      new_position = @robot.move

      return if position_is_valid?(new_position)

      @robot.roll_back
      Logger.instance.warn("Fail to move robot to #{new_position}")
    end

    private :place_robot, :robot_move, :position_is_valid?
  end
end
