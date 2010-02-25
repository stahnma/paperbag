#!/usr/bin/env ruby

require 'test/unit'
require File.dirname(__FILE__) + '/../tests/testing_defs'

class User_resource_test < Test::Unit::TestCase
  def setup
    # This probably works on most platforms...but sucks nonetheless
    system('userdel test-user &> /dev/null')
  end

  def teardown
    system('userdel test-user &> /dev/null')
  end

  def test_puppet_user
    system("/usr/bin/puppet #{HELPER_DIR}/user_add.pp")
    system("id test-user &> /dev/null")
    assert($? == 0)
  end
end
