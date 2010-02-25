# Manifest does the following:
#  creates /home/test-user
#  creates the file /home/test-user/foo
#      ownership root:bin 
#      permissions 775
#      contents are /etc/passwd
file { "/home/test-user":
    ensure => directory,
}

file { "/home/test-user/foo":
  ensure => present,
  owner => root,
  group => bin,
  mode => 775,
  subscribe => File["/home/test-user"],
  source => "/etc/passwd"
}
