require 'bundler/setup'
Bundler.require

require_all 'lib'

ActiveRecord::Base.logger = nil