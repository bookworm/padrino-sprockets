module Padrino
  module Sprockets
    class App
      def call(env)
        path = env["PATH_INFO"]
        logger.debug { "path:#{path} url:#{settings.assets.url}" }
        return settings.assets.app.call(env) unless settings.assets.matcher =~ path
        env['PATH_INFO'].sub!(settings.assets.matcher,'')
        settings.assets.sprockets_env.call(env)
      end
    end
  end
end