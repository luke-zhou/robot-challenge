# frozen_string_literal: true

class Robot
  attr_accessor :position, :direction

  def initialize
    @previous_postion = nil
    @position = nil
    @previous_direction = nil
    @direction = nil
  end

  def report
    "#{position.x}, #{position.y}, #{direction.name}" if placed?
  end

  def placed?
    !@position.nil?
  end
end
