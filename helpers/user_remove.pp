notice("Removing testuser via helper")
user { "testuser":
  ensure => absent,
}
