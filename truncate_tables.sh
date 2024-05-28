#!/bin/bash

# Apply를 원하는 YAML 파일들의 경로 목록

db_user_name=""
db_user_pass=""
rds_address="aws.jumjoo.com"
db_name="ssgpang"
dummy_file_dest="./truncate_tables.sql"

ssh -i "~/.ssh/final-key" -o StrictHostKeyChecking=no -o ProxyCommand="ssh -i ~/.ssh/final-key -W %h:%p -o StrictHostKeyChecking=no ec2-user@ec2-54-95-206-18.ap-northeast-1.compute.amazonaws.com" ec2-user@ec2-private-dns-or-ip "sudo mariadb -u $db_user_name -p'$db_user_pass' -P 3306 -h $rds_address $db_name < $dummy_file_dest"