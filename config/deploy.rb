set :application, "demoapp"
set :repository,  "https://github.com/technostacks/demoapp.git"
 
set :user, :root
 
set :deploy_to, "/var/www/home/technostacks/public_html/demo/demoapp"
 
set :use_sudo, false
 
set :scm, :git
 
role :web, "67.206.189.228"                          # Your HTTP server, Apache/etc
role :app, "67.206.189.228"                          # This may be the same as your `Web` server
role :db,  "67.206.189.228", :primary => true # This is where Rails migrations will run

 

 
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 
   desc "Installs required gems"
   task :gems, :roles => :app do
     run "cd #{current_path} && sudo rake gems:install RAILS_ENV=production"
   end
   after "deploy:setup", "deploy:gems"  
 
   before "deploy", "deploy:web:disable"
   after "deploy", "deploy:web:enable"
end