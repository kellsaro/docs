---
layout: page
title: Deploy with Nginx and Unicorn
categories: General
resource: true
description: Description of Deploy with Nginx and Unicorn 
index_order: 1
order: 1
---


# Deploy with Nginx and Unicorn

```bash
sudo apt-get update
sudo apt-get install nginx
```

suppouse the name parent folder is 'deploy':

```
deploy/
\_ /cenit
```

Add the new folders

```
deploy
\_ /cenit
\_ /shared
  \_ /pids
  \_ /sockets
  \_ /log
```

```bash
cd /etc/nginx/sites-available
```

```bash
vim default 
```

and the copy the next specification: 

```bash
upstream cenit {
    # Path to Unicorn SOCK file
    server unix:/home/ubuntu/deploy/shared/sockets/unicorn.cenit.sock fail_timeout=0;
}

server {
    # Application root, as defined previously
    root /home/ubuntu/deploy/cenit/public;

    listen  80;
    server_name localhost;

    try_files $uri/index.html $uri @cenit;

    access_log /var/log/nginx/cenit_access.log combined;
    error_log /var/log/nginx/cenit_error.log;

    location @cenit {
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_pass http://cenit;
    }

    error_page 500 502 503 504 /500.html;
    client_max_body_size 4G;
    keepalive_timeout 10;
}
```

the project has in Gemfile

```ruby
gem 'unicorn'  
```

Open up a blank unicorn.rb document, which will be saved inside config/ directory in your project:

```bash
vim config/unicorn.rb
```

Place the below block of code, modifying it as necessary:

```ruby
  # Set your full path to application.
  app_dir = File.expand_path('../../', __FILE__)
  shared_dir = File.expand_path('../../../shared/', __FILE__)
  app_name = "cenit"
 
  # Set unicorn options
  worker_processes 2
  preload_app true
  timeout 30
 
  GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true
 
  # Fill path to your app
  working_directory app_dir
 
  # Set up socket location
  listen "#{shared_dir}/sockets/unicorn.#{app_name}.sock", :backlog => 64
 
  # Loging
  stderr_path "#{shared_dir}/log/unicorn.#{app_name}.stderr.log"
  stdout_path "#{shared_dir}/log/unicorn.#{app_name}.stdout.log"
 
  # Set master PID location
  pid "#{shared_dir}/pids/unicorn.#{app_name}.pid"
 
  before_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
    old_pid = "#{server.config[:pid]}.oldbin"
    if File.exists?(old_pid) && server.pid != old_pid
      begin
        sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
        Process.kill(sig, File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
        # someone else did our job for us
      end
    end
  end
 
  after_fork do |server, worker|
    defined?(Rails) and Rails.cache.respond_to?(:reconnect) and Rails.cache.reconnect
  end
 
  before_exec do |server|
    ENV['BUNDLE_GEMFILE'] = "#{app_dir}/Gemfile"
  end
```

for run the project:

```bash
  bundle exec unicorn_rails -c config/unicorn.rb -D
  sudo service nginx restart
```

If you have some trouble with secret_key_base, you can generate a random secret key value:

```bash
$ rake secret
```	

Then take this value and put it in config/initializers/secret_token.rb:

```bash
Cenit::Application.config.secret_key_base = 'bla' # replace this
```