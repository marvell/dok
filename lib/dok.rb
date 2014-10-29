require 'dok/config'

module Dok
  class Application

    attr_reader :root, :config

    def initialize
      @root = Dir.pwd
      @config = Config.new(@root)
    end

    def init
      @config.init()
    end

  end
end
