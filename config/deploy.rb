# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'diagnose'
set :repo_url, 'gitnedab@nedab.de:~/git/diagnose.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/html/diagnose'

# Default value for :scm is :git
set :scm, :git

set :git, '/usr/bin/git'
set :scm_command, "git"
set :local_scm_command, "git"

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

set :stage, :production
set :rails_env, 'production'


SSHKit.config.command_map[:rake] = "bundle exec rake"

set :user, 'gitnedab' 
set :ssh_options, { :forward_agent => true }
set :ssh_options, {
   #verbose: :debug,
   user: fetch(:user)
}
# set :use_sudo, false
set :sudo, 'env rvmsudo_secure_path=1 rvmsudo'
set :rvm_type, :system

# set :default_env, { rvm_bin_path: '/usr/local/rvm/bin' }
# set :bundle_flags, '--deployment'

# miscellaneous options
set :deploy_via, :remote_cache
#set :deploy_via, :copy

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

#task :whoami do
#  on roles(:all) do
#    execute :whoami
#  end
#end

