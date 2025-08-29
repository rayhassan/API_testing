#!/bin/bash

token_file="$HOME/Documents/API_testing/.api_token"
token=$(cat "$token_file")

API_BASE_URL="https://api.devrev.ai"

curl -s -X POST "$API_BASE_URL/incidents.list" \
  -H "Authorization: Bearer $token" \
  -H "Content-Type: application/json" \
  -d '{}'
