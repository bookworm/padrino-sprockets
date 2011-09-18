module Padrino  
  module Sprockets
    module ClassMethods  
      def sprockets(&block) 
        self.assets(&block)   
        use Padrino::Sprockets::App, :root => root, :url => url
      end
      
      def assets(&block) 
        @options ||= Options.new(&block)
      end
    end
  end
end