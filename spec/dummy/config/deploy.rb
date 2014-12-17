require 'net/ssh/proxy/command'

# config valid only for Capistrano 3.1
lock '3.2.1'

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :pty is false
# set :pty, true

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :ssh_options, proxy: Net::SSH::Proxy::Command.new('ssh devise-ios-rails-example@g.devguru.co -W %h:%p')
set :rvm_ruby_version, '2.1.5'
set :bundle_jobs, 8
set :bundle_flags, '--deployment'
set :repo_url,  "git@github.com:netguru/devise-ios-rails-example.git"
set :rails_env, ->{ fetch(:stage) }
set :user, ->{ fetch(:application) }
set :deploy_to, ->{ "/home/#{fetch(:user)}/app" }
set :rvm_type, :system

branches = { production: :production, beta: :beta, staging: :master }
set :branch, ->{ branches[fetch(:stage).to_sym].to_s }

set :scm, :git
set :log_level, :info

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin bundle log tmp}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'
end

after "deploy:publishing", "deploy:restart"
