# frozen_string_literal: true

class Robot
  attr_reader :position, :direction, :previous_direction, :previous_position

  TURN_ANGLE = 90

  def initialize
    @previous_position = nil
    @position = nil
    @previous_direction = nil
    @direction = nil
  end

  def report
    "#{position.x}, #{position.y}, #{direction.name}" if placed?
  end

  def turn_left
    return unless placed?

    backup_current_position
    @direction.turn_anti_clock_wise(TURN_ANGLE)
  end

  def turn_right
    return unless placed?

    backup_current_position
    @direction.turn_clock_wise(TURN_ANGLE)
  end

  def move
    return unless placed?

    x_movement = cal_x_move(@direction)
    y_movement = cal_y_move(@direction)
    backup_current_position
    @position = Position.new(@position.x + x_movement, @position.y + y_movement)
  end

  def roll_back
    @direction = @previous_direction.clone
    @position = @previous_position.clone
  end

  def cal_x_move(direction)
    Math.cos(direction.angle / 180.0 * Math::PI).round.to_i
  end

  def cal_y_move(direction)
    Math.sin(direction.angle / 180.0 * Math::PI).round.to_i
  end

  def backup_current_position
    @previous_direction = @direction.clone
    @previous_position = @position.clone
  end

  def put_in(position, direction)
    @position = position
    @direction = direction
  end

  def move_out
    @position = nil
    @direction = nil
  end

  def placed?
    !@position.nil?
  end

  private :backup_current_position, :cal_x_move, :cal_y_move
end
