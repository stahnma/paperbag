require 'test/unit/testsuite'
require 'tests/test_cron'
require 'tests/test_exec'

class TS_MyTests
  def self.suite 
    suite = Test::Unit::TestSuite.new
    suite <<  Cron_resource_test.suite
    suite <<  Exec_resource_test.suite
    return suite
  end
end
Test::Unit::UI::Console::TestRunner.run(TS_MyTests)

