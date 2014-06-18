require "bundler/capistrano"

set :application, "habitat"
set :scm, :git
set :repository, "git@github.com:craigambrose/habitat.git"
set :use_sudo, false
set :bundle_flags, "--deployment --binstubs --shebang ruby-local-exec"

task :staging do
  set :user, "www"
  set :domain, "craftworks.enspiral.info"
  set :branch, "master"
  set :rails_env, "staging"
  set :deploy_to, "/home/#{user}/#{application}/"
  set :bundle_without, [:development, :test]

  role :web, domain
  role :app, domain
  role :db, domain, :primary => true
end

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"

after "deploy:update_code" do
  link_from_shared_to_current('config')
end

def link_from_shared_to_current(path, dest_path = path)
  src_path = "#{shared_path}/#{path}"
  dst_path = "#{release_path}/#{dest_path}"
  run "for f in `ls #{src_path}/` ; do ln -nsf #{src_path}/$f #{dst_path}/$f ; done"
end

