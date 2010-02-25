require File.dirname(__FILE__)  + '/../tests/test_user'
require File.dirname(__FILE__)  + '/../tests/test_cron'
require File.dirname(__FILE__)  + '/../tests/test_exec'
require 'test/unit/testsuite'

class TS_MyTests
  def self.suite 
    suite = Test::Unit::TestSuite.new
#    suite <<  User_resource_test.suite
#    suite <<  Cron_resource_test.suite
#    suite <<  Exec_resource_test.suite
    return suite
  end
end
