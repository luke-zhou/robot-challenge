# frozen_string_literal: true

class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end
