# frozen_string_literal: true

require 'spec_helper'
require 'model/command'

describe Command do
  describe '#parse' do
    it 'parse valid input - move, left, right, report' do
      expect(Command.parse('MOVE').name).to eq(:MOVE)
      expect(Command.parse('LEFT').name).to eq(:LEFT)
      expect(Command.parse('RIGHT').name).to eq(:RIGHT)
      expect(Command.parse('REPORT').name).to eq(:REPORT)
    end
    it 'parse valid input - place' do
      expect(Command.parse('PLACE 1,2,NORTH').name).to eq(:PLACE)
      expect(Command.parse('PLACE 1,2,NORTH').args[0].x).to eq(1)
      expect(Command.parse('PLACE 1,2,NORTH').args[0].y).to eq(2)
      expect(Command.parse('PLACE 1,2,NORTH').args[1].name).to eq('NORTH')
    end
    it 'parse invalid input - place' do
      expect { Command.parse('PLACE a,b,NORTH') }.to raise_error 'Invalid Command'
      expect { Command.parse('PLACE a,b,INVALID') }.to raise_error 'Invalid Command'
    end
    it 'parse invalid input' do
      expect { Command.parse('INVALID') }.to raise_error 'Invalid Command'
    end
  end
end
