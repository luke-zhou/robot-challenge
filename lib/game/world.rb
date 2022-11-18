# frozen_string_literal: true

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
      logger.info "excute #{command.name}"
      case command.name
      when :PLACE
        place_robot(command.args)
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

    def place_robot(args)
      if position_is_valid?(args[0])
        @robot.put_in(*args)
      else
        logger.warn("Fail to place robot on #{args[0]}")
      end
    end

    def robot_move
      return unless @robot.placed?

      new_position = @robot.move

      return if position_is_valid?(new_position)

      @robot.roll_back
      logger.warn("Fail to move robot to #{new_position}")
    end

    private :place_robot, :robot_move, :position_is_valid?
  end
end
