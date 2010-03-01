#!/usr/bin/env ruby

require 'test/unit'
require File.dirname(__FILE__) + '/../tests/testing_defs'

class Cron_resource_test < Test::Unit::TestCase
  def setup 
    system("yes | crontab -r 2> /dev/null ")
    system("puppet #{HELPER_DIR}/user_add.pp")
  end

  def teardown
    system("yes | crontab -r 2> /dev/null ")
    system("puppet #{HELPER_DIR}/user_remove.pp")
  end
  
  def test_puppet_cron
    system("puppet #{MANIFEST_DIR}/cron.pp")
    if RUBY_PLATFORM =~ /powerpc-aix/
      system(" crontab -l testuser | grep 'Puppet Name: uptime' >  /dev/null") 
    else
      system(" crontab -l -u testuser | grep 'Puppet Name: uptime' >  /dev/null") 
    end
    assert($? == 0)
  end
end
