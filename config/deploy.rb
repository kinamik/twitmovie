lock "~> 3.11.0"

set :application, 'twitmovie'
set :repo_url, 'https://github.com/kinamik/twitmovie.git'

set :rbenv_path, '/home/apuser/.rbenv'

set :deploy_to, '/var/www/twitmovie'

set :keep_releases, 5

set :rbenv_type, :system
set :rbenv_ruby, '2.3.3'#rubyのバージョン

set :ssh_options, :port => "10022"


set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

set :linked_dirs, %w{bin log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle}
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

set :bundle_jobs, 4




after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
# Default



