set :application, "forester"
set :scm, :git
set :repository, "git@github.com:craigambrose/craig-ambrose.git"
set :scm_username, "craigambrose"
set :scm_password, "pentex"
set :rails_env, "production"
set :deploy_to, "/home/craig/sites/#{application}"
set :user, 'craig'

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
