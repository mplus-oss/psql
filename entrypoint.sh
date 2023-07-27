#!/bin/ash

get_options_value() {
    grep -A999 "\[options\]" /opt/odoo/etc/odoo.conf | grep "$1" | awk -F'=' '{print $2}' | tr -d '[:space:]'
}

export PGHOST="$(get_options_value db_host)"
export PGPORT="$(get_options_value db_port)"
export PGUSER="$(get_options_value db_user)"
export PGPASSWORD="$(get_options_value db_password)"

exec /bin/ash