#!/usr/bin/env ruby

require 'test/unit'

# To test exec, I will remove the file we write to 
# exec the puppet manifest code 
# verify the test file exists
# remove it when done
class Exec_resource_test < Test::Unit::TestCase
  def setup
    system('rm -f /tmp/puppet-exec-test')
  end

  def teardown
    system('rm -f /tmp/puppet-exec-test')
  end

  def test_puppet_exec
    system("/usr/bin/puppet --verbose manifests/exec.pp")
    a = File.stat("/tmp/puppet-exec-test")
    assert(a.class.to_s == "File::Stat")
  end
end
