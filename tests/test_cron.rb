#!/usr/bin/env ruby

require 'test/unit'

class Cron_resource_test < Test::Unit::TestCase
  def setup 
    system("yes | crontab -r 2> /dev/null ")
    system("/usr/bin/puppet --verbose helpers/user_add.pp")
  end

  def teardown
    system("yes | crontab -r 2> /dev/null ")
    system("/usr/bin/puppet --verbose helpers/user_remove.pp")
  end
  
  def test_puppet_cron
    system("/usr/bin/puppet --verbose manifests/cron.pp")
    system(" crontab -l -u test-user | grep 'Puppet Name: uptime' ") 
    assert($? == 0)
  end

end
