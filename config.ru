require "bundler/setup"
require "rack"

run -> env {
  [200, {}, ["Hello World\n"]]
}
