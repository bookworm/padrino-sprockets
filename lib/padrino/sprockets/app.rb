module Padrino
  module Sprockets
    class App   
      def initialize(app, options)    
        @app = app     
        @options = options
      end
      def call(env)
        path = env["PATH_INFO"]      
        logger.debug { "path:#{path} url:#{@options.url}" }
        return @app.call(env) unless (@options.stylesheets_matcher =~ path && @options.handle_stylesheets) || (@options.javascripts_matcher =~ path && @options.handle_javascripts)
        # env['PATH_INFO'].sub!(@options.matcher,'')
        @options.sprockets_env.call(env)
      end
    end
  end
end