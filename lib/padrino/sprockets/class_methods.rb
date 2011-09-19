module Padrino  
  module Sprockets
    module ClassMethods  
      def sprockets(&block) 
       if block_given? 
         self.assets(&block)
       else 
         @options
       end     
      end
      
      def assets(&block) 
        @options ||= Options.new(self, &block) if block_given?    
        use Padrino::Sprockets::App, :root => root, :url => url
        @options   
      end
    end
  end
end