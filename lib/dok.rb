require 'dok/config'

module Dok
  class Application

    attr_reader :root, :name, :config

    def initialize
      @root = Dir.pwd
      @name = File.basename(@root)
      @config = Config.new(@root)
    end

    def init
      @config.init()
    end

    def image_name(environment, container)
      "#{@name}__#{environment}__#{container}"
    end

  end
end
