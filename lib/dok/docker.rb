module Dok
  class Docker
    def self.run(command, args, options={})
      arguments_string = args
      if args.is_a?(Array)
        arguments_string = args.join(' ')
      end

      options_string = ''
      options.each do |k, v|
        k = k.to_s
        if k.length == 1
          if v.nil?
            options_string += "-#{k} "
          else
            options_string += "-#{k} #{v} "
          end
        else
          options_string += "--#{k}=\"#{v}\" "
        end
      end

      system("docker #{command} #{options_string} #{arguments_string}")
    end
  end
end