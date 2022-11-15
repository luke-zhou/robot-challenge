# frozen_string_literal: true

class Direction
  attr_accessor :axis, :sign

  DIRECTIONS = {
    'NORTH' => [:y, 1],
    'SOUTH' => [:y, -1],
    'EAST' => [:x, 1],
    'WEST' => [:x, -1]
  }.freeze

  def initialize(axis, sign)
    @axis = axis
    @sign = sign
  end

  def self.parse(direction_string)
    raise 'Unknow Direction' unless DIRECTIONS[direction_string]

    Direction.new(*DIRECTIONS[direction_string])
  end

  def name
    case axis
    when :x
      sign == 1 ? 'EAST' : 'WEST'
    when :y
      sign == 1 ? 'NORTH' : 'SOUTH'
    end
  end
end
