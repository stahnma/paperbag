notice("Adding test-user via helper")
user { "test-user": 
  ensure => present,
}
