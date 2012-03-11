require "bundler/setup"
require "test/unit"
require "mongoid"

require File.expand_path("../../lib/mongoid/sequence", __FILE__)

Mongoid.configure do |config|
  name = "mongoid_sequence_test"
  config.master = Mongo::Connection.new.db(name)
end

Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |f| require f }

def teardown_db
  Mongoid.master.collections.select {|c| c.name !~ /system/ }.each(&:remove)
end

class BaseTest < Test::Unit::TestCase
  def teardown
    teardown_db
  end
end
