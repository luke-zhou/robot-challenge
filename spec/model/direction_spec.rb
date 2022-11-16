# frozen_string_literal: true

require 'spec_helper'
require 'model/direction'

describe Direction do
  describe '#parse' do
    it 'parse valid input' do
      expect(Direction.parse('EAST').angle).to eq(0)
      expect(Direction.parse('EAST').name).to eq('EAST')
      expect(Direction.parse('WEST').angle).to eq(180)
      expect(Direction.parse('WEST').name).to eq('WEST')
      expect(Direction.parse('NORTH').angle).to eq(90)
      expect(Direction.parse('NORTH').name).to eq('NORTH')
      expect(Direction.parse('SOUTH').angle).to eq(270)
      expect(Direction.parse('SOUTH').name).to eq('SOUTH')
    end
    it 'parse unknown angle' do
      expect(Direction.new(100).name).to eq('UNKNOWN')
    end
    it 'parse invalid input' do
      expect { Direction.parse('INVALID') }.to raise_error 'Unknown Direction'
    end
  end
end
