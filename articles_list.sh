#!/bin/bash

token_file="$HOME/Documents/API_testing/.api_token"
token=$(cat "$token_file")

API_BASE_URL="https://api.devrev.ai"

curl -s -X GET $API_BASE_URL/articles.list \
     -H "Authorization: Bearer $token" 


# sh ./works_list.sh | jq '.works[].display_id' 
#"TKT-8"
#"TKT-7"
#"TKT-6"
#...

# sh ./works_list.sh | jq '.works[].display_id, (.works[].account.display_name == "ray-m-hassan"), .works[].body'


