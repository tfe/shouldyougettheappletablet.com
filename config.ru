# Static site using Rack (with expire headers and etag support)... great for hosting static sites on Heroku
# From: http://manalang.com/static-websites-with-heroku
 
require File.dirname(__FILE__) + '/vendor/gems/environment'
Bundler.require_env
require 'rack-rewrite'
 
use Rack::Rewrite do
  rewrite '/', '/index.html'
end

run Rack::Directory.new('public')
