lock "~> 3.11.0"

set :user, "deployer"
set :application, "car"
set :repo_url, "git@github.com:cihad/car.git"
set :branch, "develop"
set :deploy_to, "/home/deployer/apps/car"
set :pty, true

set :rails_env, 'production'
set :migration_role, :app
set :assets_manifests, ['app/assets/config/manifest.js']
set :keep_assets, 2
append :linked_files, "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", 'public/uploads', "public/.well-known"

set :chruby_ruby, "ruby-2.5.1"

set :puma_conf, "#{shared_path}/config/puma.rb"

set :app_server_socket, "#{shared_path}/tmp/sockets/#{fetch :application}.sock"

namespace :deploy do
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  before 'deploy:migrate', 'deploy:db:create'
  after 'puma:smart_restart', 'nginx:restart'
end