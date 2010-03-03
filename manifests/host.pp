#host.pp
notice("Adding tyr.websages.com to /etc/hosts")
host { 'tyr.websages.com':
  target => "/etc/hosts",
  host_aliases => [ "tyr", "wiki" ],
  ip => '74.207.233.45',
  ensure => 'present'
}
