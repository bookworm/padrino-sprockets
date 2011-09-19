module Padrino
  module Sprockets
    class App
      def call(env)
        path = env["PATH_INFO"]
        logger.debug { "path:#{path} url:#{assets.url}" }
        return assets.app.call(env) unless assets.matcher =~ path
        env['PATH_INFO'].sub!(assets.matcher,'')
        assets.sprockets_env.call(env)
      end
    end
  end
end