#!/usr/bin/env ruby

require 'test/unit'
require File.dirname(__FILE__) + '/../tests/testing_defs'

class File_resource_test < Test::Unit::TestCase
  def setup
    system("puppet #{MANIFEST_DIR}/files.pp")
  end

  def teardown
    system('rm -rf /tmp/testuser')
  end

  def test_puppet_file_dir
    a = File.stat("/tmp/testuser")
    # Exists
    assert(a.class.to_s == "File::Stat")
    # Is a directory
    assert(a.directory? == true)
  end
  
  def test_puppet_file_created
    a = File.stat("/tmp/testuser/foo")
    # Exists
    assert(a.class.to_s == "File::Stat")
    # Owner is root	
    assert(a.uid == 0)
    # Contents contain something somewhat like a passwd file
    rootline = `grep ^root /tmp/testuser/foo`
    assert(rootline =~ /root\:.\:0/ )
  end
end
