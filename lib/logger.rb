# frozen_string_literal: true

require 'singleton'
require 'logging'

class Logger
  include Singleton

  def initialize
    @logger = Logging.logger['Robot']
    @logger.level = :info
    @logger.add_appenders(Logging.appenders.file('robot-challenge.log'))
  end

  def method_missing(method, *args, &block)
    if method.to_s =~ /^(debug|info|warn|error|fatal)$/
      @logger.send(method, args[0])
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s =~ /^(debug|info|warn|error|fatal)$/ || super
  end
end
