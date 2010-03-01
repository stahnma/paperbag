import "../helpers/user_add.pp"

notice("Attempting to create cronjob in testuser's crontab")
cron { "uptime":
    name => "uptime",
    command => "/opt/freeware/bin/uptime",
    user => testuser,
    hour => 2,
    minute => 0,
    require => User['testuser']
}

