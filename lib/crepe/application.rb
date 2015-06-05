require 'crepe/application/configuration'

module Crepe
  class << self
    attr_accessor :application
  end

  # Provides a singleton-esque accessor to a Crepe application and houses
  # configuration for an application.
  class Application
    attr_reader :config

    def initialize
      @config = Configuration.new

      # Support multiple Crepe applications like Rails, but by default set
      # Crepe.application to be the first application initialized.
      Crepe.application ||= self
    end

    def configure(&block)
      if block.arity == 1
        yield config
      else
        instance_eval(&block)
      end
    end
  end
end