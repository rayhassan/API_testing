#!/bin/bash

token_file="$HOME/Documents/API_testing/.api_token"
token=$(cat "$token_file")

API_BASE_URL="https://api.devrev.ai"

curl -s -X GET "$API_BASE_URL/dev-users.self" \
  -H "Authorization: Bearer $token" \
  -H "Content-Type: application/json"

