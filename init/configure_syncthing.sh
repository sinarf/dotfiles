#!/usr/bin/env bash
# author Michel Blavin

echo "Starts and enable syncthing service for current user"

systemctl status syncthing@sinarf.service
systemctl start syncthing@sinarf.service
systemctl enable syncthing@sinarf.service
systemctl status syncthing@sinarf.service
