require 'bundler/capistrano'
require 'rvm/capistrano'
set :db_local_clean, true
set :deploy_to, '/root/projects/my_flicker'
set :keep_releases, 5
set :rvm_ruby_string, '1.9.3-p429@my_flicker'
set :rvm_type, :system
server "198.199.65.232", :web, :app, :db, :primary => true
set :application, 'my_flicker'
set :scm        , :git
set :repository , 'https://github.com/junaid211/PhotoSharing.git'
set :branch, "master"
set :user       , 'root'
set :use_sudo   , false
set :rails_env, "development"
ENV["RAILS_ENV"] = "development"

namespace :paths do
  desc "Link paths of required files"
  task :link_paths do
    run "ln -sf #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
end
after 'deploy:update_code', "paths:link_paths"
