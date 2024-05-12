#!/usr/bin/env bash

souce .env
doppler setup

sudo mkdir -p pgdata/data
sudo chown -R 1001:1001 pgdata
