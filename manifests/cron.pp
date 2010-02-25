import "../helpers/user_add.pp"

notice("Attempting to create cronjob in test-user's crontab")
cron { "uptime":
    name => "uptime",
    command => "/opt/freeware/bin/uptime",
    user => test-user,
    hour => 2,
    minute => 0,
    require => User['test-user']
}

