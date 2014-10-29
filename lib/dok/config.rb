require 'fileutils'

module Dok
  class Config

    CONFIG_DIRECTORY = '.dok'
    CONFIG_FILE = 'config.rb'

    attr_reader :path

    def initialize(path)
      @path = File.join(path, CONFIG_DIRECTORY)
    end

    def base_directory_exists?
      File.exists?(@path)
    end

    def create_directories(environments = ['development', 'production'])
      Dir.mkdir(@path)
      environments.each { |env| Dir.mkdir(File.join(@path, env)) }
    end

    def touch
      FileUtils.touch(File.join(@path, CONFIG_FILE))
    end

  end
end