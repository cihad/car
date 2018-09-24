require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
require "capistrano/chruby"
require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require 'capistrano/nginx'
require 'capistrano/puma'
require 'capistrano/puma/nginx'
require "capistrano/chruby"
require 'capistrano/rails'
require 'capistrano/rails/db'

install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Nginx
install_plugin Capistrano::Puma  # Default puma tasks
install_plugin Capistrano::Puma::Nginx  # if you want to upload a nginx site template
# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
