#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo "🧹 Starting Docker cleanup..."

# 1. Remove all stopped containers
echo "→ Removing stopped containers..."
containers=$(docker ps -aq --filter "status=exited")
if [[ -n "$containers" ]]; then
  docker rm $containers
  echo "   Removed containers: $containers"
else
  echo "   No stopped containers to remove."
fi

# 2. Remove dangling images (those without a tag)
echo "→ Removing dangling images..."
images=$(docker images -f "dangling=true" -q)
if [[ -n "$images" ]]; then
  docker rmi $images
  echo "   Removed images: $images"
else
  echo "   No dangling images to remove."
fi

# 3. Remove unused volumes
echo "→ Removing unused volumes..."
volumes=$(docker volume ls -qf "dangling=true")
if [[ -n "$volumes" ]]; then
  docker volume rm $volumes
  echo "   Removed volumes: $volumes"
else
  echo "   No unused volumes to remove."
fi

# 4. (Optional) Prune networks
echo "→ Pruning unused networks..."
docker network prune -f
echo "   Unused networks pruned."

echo "✅ Docker cleanup complete!"
