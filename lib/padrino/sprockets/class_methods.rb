module Padrino  
  module Sprockets
    module ClassMethods  
      def sprockets(&block) 
        self.assets(&block)   
      end
      
      def assets(&block) 
        @options ||= Options.new(&block)     
        use Padrino::Sprockets::App, :root => root, :url => url
      end
    end
  end
end