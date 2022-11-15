# frozen_string_literal: true

require 'spec_helper'
require 'model/direction'

describe Direction do
  describe '#parse' do
    it 'parse valid input' do
      expect(Direction.parse('EAST').axis).to eq(:x)
      expect(Direction.parse('EAST').sign).to eq(1)
      expect(Direction.parse('WEST').axis).to eq(:x)
      expect(Direction.parse('WEST').sign).to eq(-1)
      expect(Direction.parse('NORTH').axis).to eq(:y)
      expect(Direction.parse('NORTH').sign).to eq(1)
      expect(Direction.parse('SOUTH').axis).to eq(:y)
      expect(Direction.parse('SOUTH').sign).to eq(-1)
    end
    it 'parse invalid input' do
      expect { Direction.parse('INVALID') }.to raise_error 'Unknow Direction'
    end
  end
  describe '#name' do
    it 'should return EAST' do
      direction = Direction.new(:x, 1)
      expect(direction.name).to eq('EAST')
    end
    it 'should return WEST' do
      direction = Direction.new(:x, -1)
      expect(direction.name).to eq('WEST')
    end
    it 'should return NORTH' do
      direction = Direction.new(:y, 1)
      expect(direction.name).to eq('NORTH')
    end
    it 'should return SOUTH' do
      direction = Direction.new(:y, -1)
      expect(direction.name).to eq('SOUTH')
    end
  end
end
