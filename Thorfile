class Monk < Thor
  include Thor::Actions

  desc "test", "Run all tests."
  def test
    $:.unshift File.join(File.dirname(__FILE__), "test")

    require 'cutest'
    Cutest.run(Dir['./test/**/*_test.rb'])
  end

  desc "start", "Start the server."
  def start(env=ENV['RACK_ENV'] || 'development')
    exec "env RACK_ENV=#{env} ruby init.rb"
  end

  desc "irb", "Starts a console."
  def irb(env=ENV['RACK_ENV'] || 'development')
    exec "env RACK_ENV=#{env} irb -r./init.rb"
  end

private
  def exec(cmd)
    say_status :run, cmd
    super
  end

  def self.source_root
    File.dirname(__FILE__)
  end
end

Dir['./app/**/*.thor'].each { |thor| load thor }
