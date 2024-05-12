#!/usr/bin/env bash

docker exec -it postgres pg_dumpall -U postgres > /home/dirgeable/backups/pg_backup_$(date -d "today" +"%m-%d-%H").bak
