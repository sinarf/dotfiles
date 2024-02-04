#!/usr/bin/env sh

NC='\033[0m'
BLUE='\033[34m'

launch_bar() {
  IFACE_ETH=${eth} IFACE_WLAN=${wlan} polybar "$2" &
}

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u "$(id -u)" -x polybar >/dev/null; do
  sleep 1
done

eth=$(ip link | grep -m 1 -E '\b(en).*\b(state UP)' | awk '{print substr($2, 1, length($2)-1)}')
wlan=$(ip link | grep -m 1 -E '\b(wl)' | awk '{print substr($2, 1, length($2)-1)}')
printf "Found network interfaces: ${BLUE}%s${NC} (eth), ${BLUE}%s${NC} (wlan)\\n" "${eth}" "${wlan}"

launch_bar top
