# Offical Docker Images for Abyss
1. Make sure you have buildah 1.19 or newer installed
2. Run ./all.sh
3. If it doesn't work, `buildah rmi -fa`, then repeat 2

For dedicated building machines, use cron.sh instead.

## File Organization
`containers/` - contains the actual container build scripts.
`data/` - contains various shared data and state files.
