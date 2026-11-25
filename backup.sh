#!/usr/bin/bash
set -a
. "/home/stealth/Les5/shvirtd-example-python/.env"
set +a

docker run --rm --entrypoint "" \
  --network "shvirtd-example-python_backend" \
  -e MYSQL_USER \
  -e MYSQL_PASSWORD \
  -e MYSQL_DATABASE \
  --volume "/opt/backup:/backup" \
  schnitzler/mysqldump:3.18 \
  sh -c '
    exec mysqldump --single-transaction --quick --no-tablespaces \
      --host="db" \
      --port="3306" \
      --user=$MYSQL_USER \
      --password=$MYSQL_PASSWORD \
      --result-file="/backup/$1" \
      "$MYSQL_DATABASE"
  ' sh "$(date +'%Y%m%d_%H%M%S').sql"

