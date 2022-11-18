module Game
  autoload :Command, 'game/command'
  autoload :Direction, 'game/direction'
  autoload :Position, 'game/position'
  autoload :Robot, 'game/robot'
  autoload :World, 'game/world'
  autoload :Logger, 'game/logger'
end

def logger
  Game::Logger.logger
end
