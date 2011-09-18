module Padrino
  module Sprockets
    class App
      def call(env)
        path = env["PATH_INFO"]
        logger.debug { "path:#{path} url:#{settings.url}" }
        return settings.app.call(env) unless settings.matcher =~ path
        env['PATH_INFO'].sub!(settings.matcher,'')
        settings.sprockets_env.call(env)
      end
    end
  end
end