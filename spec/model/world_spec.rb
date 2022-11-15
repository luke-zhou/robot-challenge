# frozen_string_literal: true

require 'spec_helper'
require 'model/position'
require 'model/world'

describe World do
  dimension = 5
  describe '#position_is_valid?' do
    let(:world) { World.new(dimension, dimension) }

    it 'returns true when x and y are valid' do
      position = Position.new(2, 3)

      expect(world.position_is_valid?(position)).to be true
    end

    it 'returns false when too big' do
      positions = [
        [dimension, 2],
        [2, dimension],
        [dimension, dimension]
      ]
      positions.map { |p| Position.new(*p) }.each do |p|
        expect(world.position_is_valid?(p)).to be false
      end
    end

    it 'returns false when negative' do
      positions = [
        [-1, 2],
        [2, -1],
        [-1, -1]
      ]
      positions.map { |p| Position.new(*p) }.each do |p|
        expect(world.position_is_valid?(p)).to be false
      end
    end

    it 'returns true when on edge' do
      positions = [
        [dimension - 1, dimension - 1],
        [dimension - 1, 0],
        [0, dimension - 1],
        [0, 0]
      ]
      positions.map { |p| Position.new(*p) }.each do |p|
        expect(world.position_is_valid?(p)).to be true
      end
    end
  end
end
