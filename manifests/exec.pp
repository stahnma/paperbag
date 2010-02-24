# exec
notice("Testing exec")
exec { "touch":
  path => "/usr/bin",
  command => "touch /tmp/puppet-exec-test",
}
