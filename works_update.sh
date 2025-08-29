#!/bin/bash

token_file="$HOME/Documents/API_testing/.api_token"
token=$(cat "$token_file")

API_BASE_URL="https://api.devrev.ai"

curl -s -X POST $API_BASE_URL/works.update \
     -H "Authorization: Bearer $token" \
     -H 'Accept: application/json' \
     -H 'Content-Type: application/json' \
     -d '{
     "work": {
        "id": "TKT-8",
        "title": "Updated Ticket Title",
        "priority": "P2",
        "type": "issue",
        "state": "done",  # Changed from "fixed" to "done"
        "tags": ["bug", "frontend"],
        }
     }'


# sh ./works_list.sh | jq '.works[].display_id' 
#"TKT-8"
#"TKT-7"
#"TKT-6"
#...

# sh ./works_list.sh | jq '.works[].display_id, (.works[].account.display_name == "ray-m-hassan"), .works[].body'


