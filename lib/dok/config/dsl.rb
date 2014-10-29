module Dok
  class Config
    class DSL

      attr_reader :environments

      def initialize(path)
        @path = path
        @environments = {}

        instance_eval(File.read(@path))
      end

      def environment(name)
        @containers = {}
        yield
        @environments[name.to_sym] = @containers
        @containers = nil
      end

      def container(name, params)
        params = params.inject({}) { |memo, (k,v)| memo[k.to_sym] = v; memo }
        if params[:build]
          params[:build] = File.join(File.dirname(@path), params[:build])

          if File.directory?(params[:build])
            params[:build] = File.join(params[:build], 'Dockerfile')
          end

          params[:build] = File.expand_path(params[:build])
        end

        @containers[name.to_sym] = params
      end

    end
  end
end