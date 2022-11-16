# frozen_string_literal: true

require 'spec_helper'
require 'model/position'
require 'model/robot'
require 'model/direction'

describe Robot do
  describe '#turn_left' do
    it 'should update robot direction' do
      robot = Robot.new
      robot.put_in(Position.new(0, 0), Direction.new(90))
      robot.turn_left
      expect(robot.direction.angle).to eq(180)
      expect(robot.previous_direction.angle).to eq(90)
    end
  end
  describe '#turn_right' do
    it 'should update robot direction' do
      robot = Robot.new
      robot.put_in(Position.new(0, 0), Direction.new(90))
      robot.turn_right
      expect(robot.direction.angle).to eq(0)
      expect(robot.previous_direction.angle).to eq(90)
    end
  end
  describe '#turn_right' do
    it 'should update robot direction' do
      robot = Robot.new
      robot.put_in(Position.new(0, 0), Direction.new(90))
      robot.turn_right
      expect(robot.direction.angle).to eq(0)
      expect(robot.previous_direction.angle).to eq(90)
    end
  end
  describe '#move' do
    it 'should update robot position - north' do
      robot = Robot.new
      robot.put_in(Position.new(0, 0), Direction.new(90))
      robot.move
      expect(robot.direction.angle).to eq(90)
      expect(robot.previous_direction.angle).to eq(90)
      expect(robot.position.x).to eq(0)
      expect(robot.previous_position.x).to eq(0)
      expect(robot.position.y).to eq(1)
      expect(robot.previous_position.y).to eq(0)
    end
    it 'should update robot position - south' do
      robot = Robot.new
      robot.put_in(Position.new(0, 0), Direction.new(270))
      robot.move
      expect(robot.direction.angle).to eq(270)
      expect(robot.previous_direction.angle).to eq(270)
      expect(robot.position.x).to eq(0)
      expect(robot.previous_position.x).to eq(0)
      expect(robot.position.y).to eq(-1)
      expect(robot.previous_position.y).to eq(0)
    end
    it 'should update robot position - west' do
      robot = Robot.new
      robot.put_in(Position.new(0, 0), Direction.new(180))
      robot.move
      expect(robot.direction.angle).to eq(180)
      expect(robot.previous_direction.angle).to eq(180)
      expect(robot.position.x).to eq(-1)
      expect(robot.previous_position.x).to eq(0)
      expect(robot.position.y).to eq(0)
      expect(robot.previous_position.y).to eq(0)
    end
    it 'should update robot position - east' do
      robot = Robot.new
      robot.put_in(Position.new(0, 0), Direction.new(0))
      robot.move
      expect(robot.direction.angle).to eq(0)
      expect(robot.previous_direction.angle).to eq(0)
      expect(robot.position.x).to eq(1)
      expect(robot.previous_position.x).to eq(0)
      expect(robot.position.y).to eq(0)
      expect(robot.previous_position.y).to eq(0)
    end
  end
  describe '#roll_back' do
    it 'should roll back to previouse position and direction' do
      robot = Robot.new
      robot.put_in(Position.new(0, 0), Direction.new(90))
      robot.move
      robot.roll_back
      expect(robot.direction.angle).to eq(90)
      expect(robot.previous_direction.angle).to eq(90)
      expect(robot.position.x).to eq(0)
      expect(robot.previous_position.x).to eq(0)
      expect(robot.position.y).to eq(0)
      expect(robot.previous_position.y).to eq(0)
    end
  end
  describe '#multi actions' do
    it 'should move to the middle spot' do
      robot = Robot.new
      robot.put_in(Position.new(0, 0), Direction.new(90))
      robot.move
      robot.turn_right
      robot.move
      robot.move
      robot.move
      robot.turn_left
      robot.move
      robot.turn_left
      robot.move
      expect(robot.report).to eq('2, 2, WEST')
    end
  end
end
