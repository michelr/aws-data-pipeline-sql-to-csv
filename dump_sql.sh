#!/usr/bin/env bash

file_name=$1
query=$2
host=$3
user=$4
db=$5
pwd=$6

export PGPASSWORD=$pwd
 
# install postgres in AmazonLinux
sudo yum install -y postgresql94
echo "Postgres installed"

echo "creating csv in : "$OUTPUT1_STAGING_DIR
LC_ALL="sv_SE.UTF-8"
PGTZ=Europe/Rome psql -h $host -d $db -U $user -c "\copy ($query) TO stdout WITH CSV HEADER" | gzip > $OUTPUT1_STAGING_DIR/$file_name.csv.gz
echo "finished creating "$file_name".csv.gz"
