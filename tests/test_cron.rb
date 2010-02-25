#!/usr/bin/env ruby

require 'test/unit'
require File.dirname(__FILE__) + '/../tests/testing_defs'

class Cron_resource_test < Test::Unit::TestCase
  def setup 
    system("yes | crontab -r 2> /dev/null ")
    system("/usr/bin/puppet #{HELPER_DIR}/user_add.pp")
  end

  def teardown
    system("yes | crontab -r 2> /dev/null ")
    system("/usr/bin/puppet #{HELPER_DIR}/user_remove.pp")
  end
  
  def test_puppet_cron
    system("/usr/bin/puppet #{MANIFEST_DIR}/cron.pp")
    system(" crontab -l -u test-user | grep 'Puppet Name: uptime' >  /dev/null") 
    assert($? == 0)
  end
end
