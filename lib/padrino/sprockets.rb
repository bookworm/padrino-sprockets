# encoding: utf-8       
require 'padrino-core/tasks'
require "sprockets/environment"
module Padrino
  module Sprockets
    def self.registered(app)
      unless app.root?
        raise Error, "Please set :root in your app."
      end    
      app.extend ClassMethods
    end  
      
    PREFIX = File.dirname(__FILE__)

    autoload :ClassMethods,  "#{PREFIX}/sprockets/class_methods"
    autoload :Options,       "#{PREFIX}/sprockets/options"
    autoload :Configurator,  "#{PREFIX}/sprockets/configurator"

    Error = Class.new(StandardError)

    require "#{PREFIX}/sprockets/version" 
    require "#{PREFIX}/sprockets/app"      
    ::Padrino::Tasks.files << Dir[File.dirname(__FILE__) + "/sprockets/tasks/**/*.rb"]
  end
end 