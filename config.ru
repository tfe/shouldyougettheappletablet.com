# Static site using Rack (with expire headers and etag support)... great for hosting static sites on Heroku
# From: http://manalang.com/static-websites-with-heroku
 
begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

Bundler.require
 
use Rack::Rewrite do
  rewrite '/', '/index.html'
end

run Rack::Directory.new('public')
