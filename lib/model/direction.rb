# frozen_string_literal: true

class Direction
  attr_reader :angle

  DIRECTIONS = {
    'NORTH' => 90,
    'SOUTH' => 270,
    'EAST' => 0,
    'WEST' => 180
  }.freeze

  NAME = {
    90 => 'NORTH',
    270 => 'SOUTH',
    0 => 'EAST',
    180 => 'WEST'
  }.freeze

  def initialize(angle)
    @angle = angle
  end

  def self.parse(direction_string)
    raise 'Unknown Direction' unless DIRECTIONS[direction_string]

    Direction.new(DIRECTIONS[direction_string])
  end

  def name
    NAME[angle].nil? ? 'UNKNOWN' : NAME[angle]
  end

  def turn_clock_wise(angle)
    @angle = (@angle - angle) % 360
  end

  def turn_anti_clock_wise(angle)
    @angle = (@angle + angle) % 360
  end
end
