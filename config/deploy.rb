# require 'mongrel_cluster/recipes'
# set :stages, %w(slice slice2)
# require 'capistrano/ext/multistage'

set :application, "stylfy"

set :domain, "173.45.226.52"

set :user, "deploy"
set :deploy_to, "/home/andy/apps/#{application}"

set :scm, "git"
#set :deploy_via, :copy
set :deploy_via, :remote_cache
set :copy_cache, true
set :repository,  "git@github.com:mrandyclark/stylfy.git" 
set :branch, "master"

set :chmod755, %w(app config db lib public vendor script tmp public/dispatch.cgi public/dispatch.fcgi public/dispatch.rb)
set :use_sudo, false
default_run_options[:pty] = true

## config for ssh
ssh_options[:port] = 1985
ssh_options[:username] = 'deploy'
ssh_options[:host_key] = 'ssh-dss'

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
  # reset passenger  
	desc "Restart Application"
	task :restart do
		run "touch #{current_path}/tmp/restart.txt"
	end
end




