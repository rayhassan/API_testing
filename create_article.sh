#!/bin/bash

token_file="$HOME/Documents/API_testing/.api_token"
token=$(cat "$token_file")

API_BASE_URL="https://api.devrev.ai"

curl -s -X POST "$API_BASE_URL/articles.create" \
     -H "Authorization: Bearer $token" \
     -H "Content-Type: application/json" \
     -d '{
  "owned_by": [
    "SYSU-1"
  ],
  "resource": {
    "url": "safc.com"
  },
  "title": "new signings article",
  "status": "review_needed"
}'

curl -s -X POST "$API_BASE_URL/articles.create" \
     -H "Authorization: Bearer $token" \
     -H "Content-Type: application/json" \
     -d '{
  "owned_by": [
    "SYSU-1"
  ],
  "resource": {
    "url": "bbc.co.uk"
  },
    "title": "Enterprise SSO Authentication Failure - All Users Affected",
    "description": "Complete SSO failure affecting all 500+ enterprise users. Unable to authenticate since 2PM EST. Business critical - blocking all productivity.",
    "status": "review_needed"
}'

curl -s -X POST "$API_BASE_URL/articles.create" \
     -H "Authorization: Bearer $token" \
     -H "Content-Type: application/json" \
     -d '{
  "owned_by": [
    "SYSU-1"
  ],
  "resource": {
    "url": "nist.gov"
  },
    "title": "How do I bulk export customer data for compliance audit?",
    "description": "We need to export all customer data for our quarterly compliance audit. Cannot find bulk export option in the UI. Need CSV format with all fields.",
    "status": "review_needed"
  }'
