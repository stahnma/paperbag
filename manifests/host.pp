#host.pp

host { 'olive':
  ip => '10.229.2.28',
  ensure => 'present'
}
