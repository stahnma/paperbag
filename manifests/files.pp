# Manifest does the following:
#  creates /tmp/testuser
#  creates the file /tmp/testuser/foo
#      ownership root
#      permissions 775
#      contents are /etc/passwd
file { "/tmp/testuser":
    ensure => directory,
}

file { "/tmp/testuser/foo":
  ensure => present,
  owner => root,
  mode => 775,
  subscribe => File["/tmp/testuser"],
  source => "/etc/passwd"
}
