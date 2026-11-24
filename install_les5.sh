#!/usr/bin/env bash
git clone https://github.com/StealthSochi/les5.git /opt/les5
cd /opt/les5
docker compose up -d --build
