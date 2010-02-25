# Manifest does the following:
#  creates /tmp/test-user
#  creates the file /tmp/test-user/foo
#      ownership root
#      permissions 775
#      contents are /etc/passwd
file { "/tmp/test-user":
    ensure => directory,
}

file { "/tmp/test-user/foo":
  ensure => present,
  owner => root,
  mode => 775,
  subscribe => File["/tmp/test-user"],
  source => "/etc/passwd"
}
