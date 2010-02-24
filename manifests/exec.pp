# exec
notice("Testing exec")
exec { "touch":
  path => "/usr/bin:/bin",
  command => "touch /tmp/puppet-exec-test",
}
