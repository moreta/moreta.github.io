---
title: Capistrano command cookbook
date: 2014-07-10
tags: capistrano, cookbook, command
---

`bundle exec cap -T`

```
cap bundler:install                # Install the current Bundler environment
cap bundler:map_bins               # Maps all binaries to use `bundle exec` by default
cap deploy                         # Deploy a new release
cap deploy:check                   # Check required files and directories exist
cap deploy:check:directories       # Check shared and release directories exist
cap deploy:check:linked_dirs       # Check directories to be linked exist in shared
cap deploy:check:linked_files      # Check files to be linked exist in shared
cap deploy:check:make_linked_dirs  # Check directories of files to be linked exist in shared
cap deploy:cleanup                 # Clean up old releases
cap deploy:cleanup_assets          # Cleanup expired assets
cap deploy:cleanup_rollback        # Remove and archive rolled-back release
cap deploy:compile_assets          # Compile assets
cap deploy:finished                # Finished
cap deploy:finishing               # Finish the deployment, clean up server(s)
cap deploy:finishing_rollback      # Finish the rollback, clean up server(s)
cap deploy:log_revision            # Log details of the deploy
cap deploy:migrate                 # Runs rake db:migrate if migrations are set
cap deploy:normalize_assets        # Normalize asset timestampsz
cap deploy:published               # Published
cap deploy:publishing              # Publish the release
cap deploy:restart                 # Restart application
cap deploy:revert_release          # Revert to previous release timestamp
cap deploy:reverted                # Reverted
cap deploy:reverting               # Revert server(s) to previous release
cap deploy:rollback                # Rollback to previous release
cap deploy:rollback_assets         # Rollback assets
cap deploy:started                 # Started
cap deploy:starting                # Start a deployment, make sure server(s) ready
cap deploy:symlink:linked_dirs     # Symlink linked directories
cap deploy:symlink:linked_files    # Symlink linked files
cap deploy:symlink:release         # Symlink release to current
cap deploy:symlink:shared          # Symlink files and directories from shared to release
cap deploy:updated                 # Updated
cap deploy:updating                # Update server(s) by setting up a new release
cap install                        # Install Capistrano, cap install STAGES=staging,production
```


# rakeを実行

```rb
namespace :rake do
  desc "Run a task on a remote server."
  # run like: cap staging rake:invoke task=a_certain_task
  task :invoke do
    run("cd #{deploy_to}/current; /usr/bin/env rake #{ENV['task']} RAILS_ENV=#{rails_env}")
  end
end
```

```sh
cap staging rake:invoke task=rebuild_table_abc
```
