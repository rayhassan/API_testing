#!/bin/bash

token_file="$HOME/Documents/API_testing/.api_token"
token=$(cat "$token_file")

API_BASE_URL="https://api.devrev.ai"

curl -s -X POST "$API_BASE_URL/works.create" \
  -H "Authorization: Bearer $token" \
  -H "Content-Type: application/json" \
  -d '{
  "type": "issue",
  "title": "Sample API Task",
  "body": "This task was created using the DevRev API"
}'

