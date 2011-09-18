module Padrino
  module Sprockets
    class Options   
      def initialize(app, &block) 
        @app = app
        @root = app.root 
        @url  = 'assets'   
        @sprockets_env = ::Sprockets::Environment.new(@root)
        @sprockets_env.append_path 'assets/javascripts'
        @sprockets_env.append_path 'assets/stylesheets'
        @sprockets_env.append_path 'assets/images'  
        block.arity <= 0 ? instance_eval(&block) : yield(self)  if block_given?
      end 
      
      attr_reader :app  # Padrino App
      attr_reader :sprockets_env # Sprockets environment   
      attr_reader :url  # App URL  
      attr_reader :root # App root  
      attr_writer :url  # App URL
      attr_writer :root # App root  
      
      def append_path(path)     
        sprockets_env.append_path(path)
      end   
      
      def matcher()  
        @matcher = /^\/#{@url}\/*/
      end
    end
  end
end
