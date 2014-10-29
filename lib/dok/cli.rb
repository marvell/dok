require 'dok'
require 'thor'

module Dok
  class CLI < Thor

    desc 'init', 'create initial directories'
    def init
      config = Application.new.config

      if config.base_directory_exists?
        say "#{config.path} is already exists", :red
      else
        begin
          config.create_directories
          config.touch
          say "OK", :green
        rescue e
          say e.message, :red
        end
      end
    end

  end
end