#!/sbin/openrc-run
# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

description="ESPHome dashboard"

command_user="esphome:esphome"

command="/usr/bin/esphomeyaml"
command_args="
	/etc/esphome
	dashboard
	${ESPHOME_OPTS}
"

output_log="/var/log/esphome/stdout.log"
error_log="/var/log/esphome/dashboard.log"

command_background=yes
pidfile=/run/esphome.pid

depend() {
    need net
    after bootmisc
}

start_pre() {
    checkpath --file --owner $command_user --mode 0644 $output_log
    checkpath --file --owner $command_user --mode 0644 $error_log
}
