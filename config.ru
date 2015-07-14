Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require 'rubygems'
require 'bundler'

require "rack/jekyll"

#require "bundler/setup"
Bundler.require(:default)
#require './cenit_doc'

run Rack::Jekyll.new(:destination => '_site')
