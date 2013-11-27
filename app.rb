require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'logger'

class App < Sinatra::Base
  set :environment, :development

  configure :development do
    # $logger = Logger.new(STDOUT)
    set :haml, { :ugly=>true }
    set :clean_trace, true

    Dir.mkdir('logs') unless File.exist?('logs')

    $logger = Logger.new('logs/common.log','weekly')
    $logger.level = Logger::WARN

    # Spit stdout and stderr to a file during production
    # in case something goes wrong
    $stdout.reopen("logs/output.log", "w")
    $stdout.sync = true
    $stderr.reopen($stdout)
  end

  get '/hello' do
    "Hello world! hi"
  end

end
