

set :application, "fortyfiveg"
set :deploy_to, "/fortyfiveg"
set :user, "bitnami"
set :scm, "git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :repository, "git@github.com:unparallellogical/fortyfiveg.git"
set :domain, "ec2-50-17-24-103.compute-1.amazonaws.com"
set :deploy_via, :copy


# deploy config
#set :deploy_via, :export
role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` serve
role :db,  domain, :primary => true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
#


# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/home/user/.ssh/id_rsa)            # If you are using ssh_keysset :chmod755, "app config db lib public vendor script script/* public/disp*"set :use_sudo, false

# Passenger
namespace :deploy do
  task :start do
    run "cd #{current_path} && RAILS_ENV=production rails s -p 80 -d"
   end

  task :stop do
    run "killall ruby"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end
