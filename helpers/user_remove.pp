notice("Removing test-user via helper")
user { "test-user":
  ensure => absent,
}
