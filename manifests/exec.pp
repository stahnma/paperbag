# exec
notice("Testing exec by touching /tmp/puppet-exec-test")
exec { "touch":
  path => "/usr/bin:/bin",
  command => "touch /tmp/puppet-exec-test",
}
