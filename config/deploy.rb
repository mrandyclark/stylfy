#############################################################
#	Settings
#############################################################
default_run_options[:pty] = true
set :use_sudo, true

set :application, "stylfy"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/andy/apps/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:

default_run_options[:pty] = true
set :repository,  "git@github.com:mrandyclark/stylfy.git"
set :scm, "git"
set :scm_passphrase, "22?15n5" #This is your custom users password
set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }

set :user, "andy"
set :password, "22?15n5"

role :app, "173.45.226.52:1985"
role :web, "173.45.226.52:1985"
role :db,  "173.45.226.52:1985", :primary => true

#############################################################
#	Passenger
#############################################################

namespace :deploy do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "Start Application"
  task :start do
    run "touch #{current_path}/tmp/restart.txt"
  end
end