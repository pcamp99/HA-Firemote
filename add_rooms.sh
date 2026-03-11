#!/bin/bash
# Script to add rooms/areas to Home Assistant instance
# Usage: ./add_rooms.sh <HA_URL> <LONG_LIVED_ACCESS_TOKEN>
#
# Example: ./add_rooms.sh http://homeassistant.local:8123 eyJhbGciOi...

HA_URL="${1:?Usage: $0 <HA_URL> <ACCESS_TOKEN>}"
TOKEN="${2:?Usage: $0 <HA_URL> <ACCESS_TOKEN>}"

ROOMS=(
  "Main Room"
  "Playroom"
  "Office"
  "Master Bedroom"
  "Master Bathroom"
  "Gym"
  "PJ's Bedroom"
  "Guest Bedroom"
  "Media Room"
  "Foyer"
  "Laundry Room"
  "Deck"
)

for room in "${ROOMS[@]}"; do
  echo "Adding area: $room"
  response=$(curl -s -X POST \
    "${HA_URL}/api/config/area_registry/create" \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "Content-Type: application/json" \
    -d "{\"name\": \"${room}\"}")

  if echo "$response" | grep -q "area_id"; then
    echo "  -> Created successfully"
  else
    echo "  -> Response: $response"
  fi
done

echo ""
echo "Done! All 12 rooms have been processed."
