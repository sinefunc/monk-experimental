$:.unshift(*Dir["./vendor/*/lib"])

require "rubygems"
require "sinatra/base"
require "rtopia"
require "sinatra/content_for"
require "jsfiles"
require "user_agent"

Dir["./lib/**/*.rb"].each { |rb| require rb }

class Main < Sinatra::Base
  set      :root, lambda { |*args| File.join(File.dirname(__FILE__), *args) }
  set      :views, root('app', 'views')

  enable   :raise_errors, :sessions, :logging,
           :show_exceptions, :raise_errors

  use      Rack::Session::Cookie
  helpers  Rtopia
  helpers  Sinatra::ContentFor        # sinatra-content_for
  helpers  Sinatra::UserAgentHelpers  # agentsniff

  # Load all, but load defaults first
  Dir[root('config', '{*.defaults,*}.rb')].uniq.each { |f|
    load f unless f.include?('.example.')
  }

  configure :development do
    require 'pistol'
    use Pistol, Dir["./{lib,app}/**/*.rb"] { reset! and load(__FILE__) }
  end
end

Dir["./app/**/*.rb"].each { |rb| require rb }

Main.set :port, ENV['PORT'].to_i  unless ENV['PORT'].nil?
Main.run!  if __FILE__ == $0
