# Task based on the rails task of the same name
namespace :assets do
  desc "Compile all the assets."
  task :precompile => :environment do           
    
    apps = Padrino.mounted_apps
    apps.each do |app|  
      app = app.app_obj
      env = app.assets.sprockets_env
             
      prefix = app.uri_root unless app.uri_root == '/'
      prefix ||= ''
      target = Pathname.new(File.join(Padrino.root + '/public', prefix, app.assets.public_assets_folder))
       
      env.each_logical_path do |logical_path|
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