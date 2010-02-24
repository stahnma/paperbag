import "../helpers/user_add.pp"

cron { "uptime":
    name => "uptime",
    command => "/opt/freeware/bin/uptime",
    user => test-user,
    hour => 2,
    minute => 0,
    require => User['test-user']
}

