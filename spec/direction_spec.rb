# frozen_string_literal: true

describe Game::Direction do
  describe '#parse' do
    it 'parse valid input' do
      expect(Game::Direction.parse('EAST').angle).to eq(0)
      expect(Game::Direction.parse('EAST').name).to eq('EAST')
      expect(Game::Direction.parse('WEST').angle).to eq(180)
      expect(Game::Direction.parse('WEST').name).to eq('WEST')
      expect(Game::Direction.parse('NORTH').angle).to eq(90)
      expect(Game::Direction.parse('NORTH').name).to eq('NORTH')
      expect(Game::Direction.parse('SOUTH').angle).to eq(270)
      expect(Game::Direction.parse('SOUTH').name).to eq('SOUTH')
    end
    it 'parse unknown angle' do
      expect(Game::Direction.new(100).name).to eq('UNKNOWN')
    end
    it 'parse invalid input' do
      expect { Game::Direction.parse('INVALID') }.to raise_error 'Unknown Direction'
    end
  end
end
