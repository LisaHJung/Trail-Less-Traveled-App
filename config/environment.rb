require 'bundler/setup'
Bundler.require

require_all 'lib'
require 'tty-prompt'
require 'tty-box'


ActiveRecord::Base.logger = nil