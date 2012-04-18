module Padrino
  module Sprockets
    class Options
      include Configurator

      def initialize(app, &block)
        @app  = app
        @root = app.root

        @digest                = false unless Padrino.env == :production
        @digest              ||= true
        @assets_folder         = '/assets'
        @stylesheets_folder    = 'stylesheets'
        @javascripts_folder    = 'javascripts'
        @compress              = false
        @handle_stylesheets    = true
        @handle_javascripts    = true

        @digest             = app.settings.assets_digest      if app.settings.respond_to?(:assets_digest)
        @assets_folder      = app.settings.assets_folder      if app.settings.respond_to?(:assets_folder)
        @stylesheets_folder = app.settings.stylesheets_folder if app.settings.respond_to?(:stylesheets_folder)
        @javascripts_folder = app.settings.javascripts_folder if app.settings.respond_to?(:javascripts_folder)
        @assets_compress    = app.settings.assets_compress    if app.settings.respond_to?(:assets_compress)
        @handle_stylesheets = app.settings.handle_stylesheets if app.settings.respond_to?(:handle_stylesheets)
        @handle_javascripts = app.settings.handle_javascripts if app.settings.respond_to?(:handle_javascripts)

        @sprockets_env             = ::Sprockets::Environment.new(@root)
        @sprockets_env.append_path 'assets/javascripts'
        @sprockets_env.append_path 'assets/stylesheets'
        @sprockets_env.append_path 'assets/images'

        block.arity <= 0 ? instance_eval(&block) : yield(self)  if block_given?
      end

      def update(&block)
        block.arity <= 0 ? instance_eval(&block) : yield(self)  if block_given?
      end

      attrib :app                 # Padrino App
      attrib :sprockets_env       # Sprockets environment
      attrib :url                 # App URL
      attrib :root                # App root
      attrib :precompile          # Assets to precompile
      attrib :digest              # Should we use filenames or actual hashes?
      attrib :assets_folder       # The assets folder in /public
      attrib :javascripts_folder  # The javascripts assets folder in /public/assets
      attrib :stylesheets_folder  # The stylesheetss assets folder in /public/assets
      attrib :compress            # Write .gz files?
      attrib :handle_stylesheets  # Whether or not sprockets should handle the stylesheets
      attrib :handle_javascripts  # Whether or not sprockets should handle the javascripts

      def append_path(path)
        sprockets_env.append_path(path)
      end

      def stylesheets_matcher()
        /^\/#{@stylesheets_folder}\/*/
      end

      def javascripts_matcher()
        /^\/#{@javascripts_folder}\/*/
      end
    end
  end
end
