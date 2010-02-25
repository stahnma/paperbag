#!/usr/bin/env ruby

require 'test/unit'
require File.dirname(__FILE__) + '/../tests/testing_defs'

class File_resource_test < Test::Unit::TestCase
  def setup
    system("/usr/bin/puppet #{MANIFEST_DIR}/files.pp")
  end

  def teardown
    system('rm -rf /tmp/test-user')
  end

  def test_puppet_file_dir
    a = File.stat("/tmp/test-user")
    # Exists
    assert(a.class.to_s == "File::Stat")
    # Is a directory
    assert(a.directory? == true)
  end
  
  def test_puppet_file_created
    a = File.stat("/tmp/test-user/foo")
    # Exists
    assert(a.class.to_s == "File::Stat")
    # Owner is root	
    assert(a.uid == 0)
    # Contents contain something somewhat like a passwd file
    rootline = `grep ^root /tmp/test-user/foo`
    assert(rootline =~ /root\:\*\:0/ )
  end
end
