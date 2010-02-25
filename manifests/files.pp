file { "/home/test_user":
    ensure => directory,
}

file { "/home/test_user/foo":
  ensure => present,
  owner => stahnma,
  group => bin,
  mode => 775,
  subscribe => File["/home/test_user"],
  source => "/etc/passwd"
}

file { "/home/test_user/bar":
  ensure => "/home/test_user/foo",
  subscribe  => File["/home/test_user/foo"]
}
