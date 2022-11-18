require 'logger'

module Game
  class Logger
    class << self
      def close
        logger.close
      end

      def logger
        @logger ||= ::Logger.new('robot-challenge.log').tap do |l|
          l.sev_threshold = ::Logger::INFO
        end
      end
    end
  end
end
