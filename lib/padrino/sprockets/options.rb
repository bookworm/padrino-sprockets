module Padrino
  module Sprockets
    class Options
      include Configurator
         
      def initialize(app, &block) 
        @app = app
        @root = app.root     
        @digest = false unless Padrino.env == :production
        @digest ||= true   
        @public_assets_folder = '/assets'
        @stylesheets_url = 'stylesheets'
        @javascripts_url = 'javascripts'  
        @public_stylesheets_folder = 'stylesheets'  
        @public_javascripts_folder = 'javascripts'     
        @compress = false
        @sprockets_env = ::Sprockets::Environment.new(@root)
        @sprockets_env.append_path 'assets/javascripts'
        @sprockets_env.append_path 'assets/stylesheets'
        @sprockets_env.append_path 'assets/images'  
        block.arity <= 0 ? instance_eval(&block) : yield(self)  if block_given?
      end 
      
      attrib :app  # Padrino App
      attrib :sprockets_env # Sprockets environment   
      attrib :url  # App URL  
      attrib :root # App root      
      attrib :stylesheets_url # Stylesheets URL
      attrib :javascripts_url # Javascripts URL       
      attrib :precompile      # Assets to precompile  
      attrib :digest    # Should we use filenames or actual hashes?  
      attrib :public_assets_folder    # The assets folder in /public     
      attrib :public_javascripts_folder  # The javascripts assets folder in /public/assets
      attrib :public_stylesheets_folder   # The stylesheetss assets folder in /public/assets    
      attrib :compress # Write .gz files?           
      
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
