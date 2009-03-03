default_run_options[:pty] = true
set :use_sudo, true

set :application, "stylfy"

set :deploy_to, "/home/andy/apps/#{application}"

default_run_options[:pty] = true
set :repository,  "git@github.com:mrandyclark/stylfy.git"
set :scm, "git"
set :scm_passphrase, "22?15n5"
set :branch, "master"
set :repository_cache, "git_cache"
set :ssh_options, { :forward_agent => true }

set :user, "deploy"
set :password, "deployment"

role :app, "173.45.226.52:1985"
role :web, "173.45.226.52:1985"
role :db,  "173.45.226.52:1985", :primary => true

namespace :deploy do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end