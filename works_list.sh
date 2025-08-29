#!/bin/bash

token_file="$HOME/Documents/API_testing/.api_token"
token=$(cat "$token_file")

API_BASE_URL="https://api.devrev.ai"

curl -s -X POST $API_BASE_URL/works.list \
     -H "Authorization: Bearer $token" \
     -H "Content-Type: application/json" \
     -d '{"type": ["ticket"]}'


# sh ./works_list.sh | jq '.works[].display_id' 
#"TKT-8"
#"TKT-7"
#"TKT-6"
#...

# sh ./works_list.sh | jq '.works[].display_id, (.works[].account.display_name == "ray-m-hassan"), .works[].body'
