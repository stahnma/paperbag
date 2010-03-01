#!/usr/bin/env ruby

require 'test/unit'
require File.dirname(__FILE__) + '/../tests/testing_defs'

class User_resource_test < Test::Unit::TestCase
  def setup
    # This probably works on most platforms...but sucks nonetheless
    system('userdel testuser &> /dev/null')
  end

  def teardown
    system('userdel testuser &> /dev/null')
  end

  def test_puppet_user
    system("puppet #{HELPER_DIR}/user_add.pp")
    system("id testuser &> /dev/null")
    assert($? == 0)
  end
end
