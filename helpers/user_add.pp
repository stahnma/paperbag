notice("Adding testuser via helper")
user { "testuser": 
  ensure => present,
}
