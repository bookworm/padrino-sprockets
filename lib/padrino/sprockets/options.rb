module Padrino
  module Sprockets
    class Options   
      def initialize(app, &block) 
        @app = app
        @root = app.root     
        @digest = false unless Padrino.env == :production
        @digest ||= true   
        @public_assets_folder = 'assets'
        @stylesheets_url = 'stylesheets'
        @javascripts_url = 'javascripts'
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
      attr_reader :stylesheets_url # Stylesheets URL
      attr_reader :javascripts_url # Javascripts URL       
      attr_reader :precompile      # Assets to precompile  
      attr_reader :digest    # Should we use filenames or actual hashes?  
      attr_reader :public_assets_folder    # The assets folder in /public
      attr_writer :url  # App URL
      attr_writer :root # App root      
      attr_writer :stylesheets_url # Stylesheets URL
      attr_writer :javascripts_url # Javascripts URL     
      attr_writer :precompile      # Assets to precompile      
      attr_writer :digest    # Should we use filenames or actual hashes?
      attr_writer :public_assets_folder  # The assets folder in /public
      
      def append_path(path)     
        sprockets_env.append_path(path)
      end   
      
      def stylesheets_matcher()  
        /^\/#{@stylesheets_url}\/*/
      end 
      
      def javascripts_matcher()  
        /^\/#{@javascripts_url}\/*/
      end
    end
  end
end
