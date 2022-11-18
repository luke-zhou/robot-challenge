# frozen_string_literal: true

describe Game::Command do
  describe '#parse' do
    it 'parse valid input - move, left, right, report' do
      expect(Game::Command.parse('MOVE').name).to eq(:MOVE)
      expect(Game::Command.parse('LEFT').name).to eq(:LEFT)
      expect(Game::Command.parse('RIGHT').name).to eq(:RIGHT)
      expect(Game::Command.parse('REPORT').name).to eq(:REPORT)
    end
    it 'parse valid input - place' do
      expect(Game::Command.parse('PLACE 1,2,NORTH').name).to eq(:PLACE)
      expect(Game::Command.parse('PLACE 1,2,NORTH').args[0].x).to eq(1)
      expect(Game::Command.parse('PLACE 1,2,NORTH').args[0].y).to eq(2)
      expect(Game::Command.parse('PLACE 1,2,NORTH').args[1].name).to eq('NORTH')
    end
    it 'parse invalid input - place' do
      command1 = 'PLACE a,b,NORTH'
      command2 = 'PLACE a,b,INVALID'
      expect { Game::Command.parse(command1) }.to raise_error 'Invalid Command'
      expect { Game::Command.parse(command2) }.to raise_error 'Invalid Command'
    end
    it 'parse invalid input' do
      expect { Game::Command.parse('INVALID') }.to raise_error 'Invalid Command'
    end
  end
end
