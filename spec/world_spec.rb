# frozen_string_literal: true

describe Game::World do
  dimension = 5
  describe '#position_is_valid?' do
    let(:world) { Game::World.new(dimension, dimension) }

    it 'returns true when x and y are valid' do
      position = Game::Position.new(2, 3)

      expect(world.send(:position_is_valid?, position)).to be true
    end

    it 'returns false when too big' do
      positions = [
        [dimension, 2],
        [2, dimension],
        [dimension, dimension]
      ]
      positions.map { |p| Game::Position.new(*p) }.each do |p|
        expect(world.send(:position_is_valid?, p)).to be false
      end
    end

    it 'returns false when negative' do
      positions = [
        [-1, 2],
        [2, -1],
        [-1, -1]
      ]
      positions.map { |p| Game::Position.new(*p) }.each do |p|
        expect(world.send(:position_is_valid?, p)).to be false
      end
    end

    it 'returns true when on edge' do
      positions = [
        [dimension - 1, dimension - 1],
        [dimension - 1, 0],
        [0, dimension - 1],
        [0, 0]
      ]
      positions.map { |p| Game::Position.new(*p) }.each do |p|
        expect(world.send(:position_is_valid?, p)).to be true
      end
    end
  end

  describe '#place_robot' do
    let(:world) { Game::World.new(dimension, dimension) }
    it 'should place robot with valid position' do
      place_command = Game::Command.parse('PLACE 1, 2, NORTH')
      world.send(:place_robot, place_command)
      expect(world.robot.placed?).to be true
      expect(world.robot.position.x).to eq(1)
      expect(world.robot.position.y).to eq(2)
    end
  end

  describe '#robot_move' do
    let(:world) { Game::World.new(dimension, dimension) }
    it 'should have no action if robot is not placed' do
      world.send(:robot_move)
      expect(world.robot.placed?).to be false
      expect(world.robot.position).to be nil
    end
    it 'should have roll back if new position is invalid' do
      place_command = Game::Command.parse('PLACE 0, 0, SOUTH')
      world.send(:place_robot, place_command)
      world.send(:robot_move)
      expect(world.robot.placed?).to be true
      expect(world.robot.position.x).to eq(0)
      expect(world.robot.position.y).to eq(0)
    end
    it 'should move if new position is valid' do
      place_command = Game::Command.parse('PLACE 0, 0, NORTH')
      world.send(:place_robot, place_command)
      world.send(:robot_move)
      expect(world.robot.placed?).to be true
      expect(world.robot.position.x).to eq(0)
      expect(world.robot.position.y).to eq(1)
    end
  end
end
