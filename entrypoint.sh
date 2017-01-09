#!/bin/sh
set -e

initialize_mysql_database() {
  # initialize MySQL data directory
  if [ ! -d ${MYSQL_DATA_DIR}/mysql ]; then
    echo "Installing database..."
    mysql_install_db --datadir=${MYSQL_DATA_DIR} 1>/dev/null 2>/dev/null
  fi
}

initialize_mysql_database
/usr/bin/mysqld --user=${MYSQL_USER} --datadir=${MYSQL_DATA_DIR} "$@"
