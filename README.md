# Puma Double Rack

This simple app demonstrates an issue where rack is loaded multiple times under circumstances where:

- Rack is installed on the system globally (in `GEM_HOME`)
- Rack is also in the project's `Gemfile`, and bundler is configured to install gems to a path different than `GEM_HOME` (e.g. when installing with the `--deployment` flag)
- Puma is configured to `prune_bundler`

In this example `GEM_HOME` is set to `my_gems` and bundler has installed its gems to `vendor`.

To reproduce the error simply clone this repository and run `./boot`. In the logs you should see warnings like this:

```
/home/vagrant/development/puma-double-rack/vendor/ruby/2.1.0/gems/rack-1.6.4/lib/rack.rb:14: warning: already initialized constant Rack::VERSION
/var/lib/gems/2.1.0/gems/rack-1.6.4/lib/rack.rb:14: warning: previous definition of VERSION was here
/home/vagrant/development/puma-double-rack/vendor/ruby/2.1.0/gems/rack-1.6.4/lib/rack.rb:25: warning: already initialized constant Rack::PATH_INFO
/var/lib/gems/2.1.0/gems/rack-1.6.4/lib/rack.rb:25: warning: previous definition of PATH_INFO was here
/home/vagrant/development/puma-double-rack/vendor/ruby/2.1.0/gems/rack-1.6.4/lib/rack.rb:26: warning: already initialized constant Rack::REQUEST_METHOD
/var/lib/gems/2.1.0/gems/rack-1.6.4/lib/rack.rb:26: warning: previous definition of REQUEST_METHOD was here
/home/vagrant/development/puma-double-rack/vendor/ruby/2.1.0/gems/rack-1.6.4/lib/rack.rb:27: warning: already initialized constant Rack::SCRIPT_NAME
/var/lib/gems/2.1.0/gems/rack-1.6.4/lib/rack.rb:27: warning: previous definition of SCRIPT_NAME was here
/home/vagrant/development/puma-double-rack/vendor/ruby/2.1.0/gems/rack-1.6.4/lib/rack.rb:28: warning: already initialized constant Rack::QUERY_STRING
/var/lib/gems/2.1.0/gems/rack-1.6.4/lib/rack.rb:28: warning: previous definition of QUERY_STRING was here
/home/vagrant/development/puma-double-rack/vendor/ruby/2.1.0/gems/rack-1.6.4/lib/rack.rb:29: warning: already initialized constant Rack::CACHE_CONTROL
/var/lib/gems/2.1.0/gems/rack-1.6.4/lib/rack.rb:29: warning: previous definition of CACHE_CONTROL was here
/home/vagrant/development/puma-double-rack/vendor/ruby/2.1.0/gems/rack-1.6.4/lib/rack.rb:30: warning: already initialized constant Rack::CONTENT_LENGTH
/var/lib/gems/2.1.0/gems/rack-1.6.4/lib/rack.rb:30: warning: previous definition of CONTENT_LENGTH was here
/home/vagrant/development/puma-double-rack/vendor/ruby/2.1.0/gems/rack-1.6.4/lib/rack.rb:31: warning: already initialized constant Rack::CONTENT_TYPE
/var/lib/gems/2.1.0/gems/rack-1.6.4/lib/rack.rb:31: warning: previous definition of CONTENT_TYPE was here
/home/vagrant/development/puma-double-rack/vendor/ruby/2.1.0/gems/rack-1.6.4/lib/rack.rb:33: warning: already initialized constant Rack::GET
/var/lib/gems/2.1.0/gems/rack-1.6.4/lib/rack.rb:33: warning: previous definition of GET was here
/home/vagrant/development/puma-double-rack/vendor/ruby/2.1.0/gems/rack-1.6.4/lib/rack.rb:34: warning: already initialized constant Rack::HEAD
/var/lib/gems/2.1.0/gems/rack-1.6.4/lib/rack.rb:34: warning: previous definition of HEAD was here
```
