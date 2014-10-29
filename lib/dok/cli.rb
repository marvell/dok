require 'thor'

require 'dok'
require 'dok/docker'

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

    desc 'build', 'build all environments'
    def build
      app = Application.new

      app.config.environments.each do |environment, containers|
        containers.each do |container, params|
          next unless params[:build]
          say "#{params[:build]} is not found", :red unless File.exists?(params[:build])

          say "#{app.image_name(environment, container)} building ...", :green
          File.symlink(params[:build], File.join(app.root, 'Dockerfile'))
          Docker.run('build', app.root, { t: app.image_name(environment, container) })
          File.unlink(File.join(app.root, 'Dockerfile'))
        end
      end
    end

  end
end