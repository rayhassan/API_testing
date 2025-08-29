#!/bin/bash

token_file="$HOME/Documents/API_testing/.api_token"
token=$(cat "$token_file")

API_BASE_URL="https://api.devrev.ai"

curl -s -X POST "$API_BASE_URL/articles.update" \
     -H "Authorization: Bearer $token" \
     -H "Content-Type: application/json" \
     -d '{
        "id" : "ART-1236"
        "outhored_by": [
            "SYSU-1,
        ],
        "title": "new signings article - published",
        "status": "published"
}'


# "status": "review_needed"
