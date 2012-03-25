module Padrino  
  module Sprockets
    module ClassMethods  
      def sprockets(&block) 
       if block_given? 
         self.assets(&block)
       else 
         @options ||= Options.new(self)
       end     
      end
      
      def assets(&block) 
        if block_given?  
          @options ||= Options.new(self, &block)
          use Padrino::Sprockets::App, @options
        end
        @options ||= Options.new(self)    
      end
    end
  end
end