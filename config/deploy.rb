require "bundler/capistrano"

$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, 'ruby-1.9.2-p290'        # Or whatever env you want it to run in.

set :application, "forester"
set :scm, :git
set :repository, "git@github.com:craigambrose/forester.git"
set :scm_username, "craigambrose"
set :scm_password, "pentex"
set :rails_env, "production"
set :deploy_to, "/home/craig/sites/#{application}"
set :user, 'craig'
set :use_sudo, false


set :domain, "lucid.craigambrose.com"
role :web, domain
role :app, domain
role :db,  domain, :primary => true

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup"

after "deploy:update_code" do
  link_from_shared_to_current('config')
end

def link_from_shared_to_current(path, dest_path = path)
  src_path = "#{shared_path}/#{path}"
  dst_path = "#{release_path}/#{dest_path}"
  run "for f in `ls #{src_path}/` ; do ln -nsf #{src_path}/$f #{dst_path}/$f ; done"
end

