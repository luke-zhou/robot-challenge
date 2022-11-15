# frozen_string_literal: true

require 'model/robot'

class World
  def initialize(length, width)
    @length = length
    @width = width
    @robot = Robot.new
  end

  def position_is_valid?(position)
    x_valid = position.x >= 0 && position.x < @length
    y_valid = position.y >= 0 && position.y < @width
    x_valid && y_valid
  end
end
