module Padrino
  module Sprockets
    module ClassMethods
      def sprockets(&block)
       if block_given?
         self.assets(&block)
       else
         @options ||= Options.new(self)
         use Padrino::Sprockets::App, @options
       end
      end

      def assets(&block)
        if block_given?
          if @options
            @options.update(&block)
          else
            @options = Options.new(self, &block)
          end
          use Padrino::Sprockets::App, @options
        end
        @options ||= Options.new(self)
      end
    end
  end
end
