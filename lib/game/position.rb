# frozen_string_literal: true

module Game
  class Position
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def to_s
      "(x:#{@x}, y:#{@y})"
    end
  end
end
