namespace :assets do
  desc "Compile all the assets named in config.assets.precompile"
  task :precompile => :environment do           
    
    apps = Padrino.mounted_apps
    apps.each do |app|     
      env = app.app_obj.assets.sprockets_env   
      app.assets.precompile.each do |path|  
        if path.is_a?(Regexp)
          next unless path.match(logical_path)
        elsif path.is_a?(Proc)
          next unless path.call(logical_path)
        else
          next unless File.fnmatch(path.to_s, logical_path)
        end

        if asset = env.find_asset(logical_path)
          asset_path = app.assets.digest ? asset.digest_path : logical_path
          filename = target.join(asset_path)

          mkdir_p filename.dirname
          asset.write_to(filename)
          asset.write_to("#{filename}.gz") if filename.to_s =~ /\.(css|js)$/
        end
      end
    end
  end
end