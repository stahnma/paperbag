#!/usr/bin/env ruby

require 'test/unit'
require File.dirname(__FILE__) + '/../tests/testing_defs'

# To test exec, I will remove the file we write to 
# exec the puppet manifest code 
# verify the test file exists
# remove it when done
class Host_resource_test < Test::Unit::TestCase
  def strip_etc_hosts
    # clean up hosts
    # 74.207.233.45   tyr.websages.com        tyr     wiki
    content = ""
    File.readlines('/etc/hosts').each do |line| 
      content+=line unless line.match(/^74\.207\.233\.45/)
    end
    File.open('/etc/hosts', 'w') do |f| 
      f.write(content)
    end
  end

  def setup
    strip_etc_hosts
  end

  def teardown
    strip_etc_hosts
  end

  def test_puppet_host
    system("puppet #{MANIFEST_DIR}/host.pp")
    a = false
    File.open("/etc/hosts").each do |line|
      a = true if line =~ /^74\.207\.233\.45/
    end 
    assert(a)
  end
end
