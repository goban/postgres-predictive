#!/bin/bash
set -e

echo "host replication all 0.0.0.0/0 md5" >> /var/lib/postgresql/data/pg_hba.conf
echo "wal_level = logical" >> /var/lib/postgresql/data/postgresql.conf

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE DATABASE postgres-predictive;
	GRANT ALL PRIVILEGES ON DATABASE postgres-predictive TO postgres;
EOSQL
