#!/bin/bash

token_file="$HOME/Documents/API_testing/.api_token"
DEVREV_TOKEN=$(cat "$token_file")

API_BASE_URL="https://api.devrev.ai"


echo "🚀 AcmeCorp DevRev Demo - API Integration Scripts"
echo "=================================================="

# 1. KNOWLEDGE BASE SETUP (Demo Part 1 - Self Service)
echo ""
echo "Creating Knowledge Base Articles for PLuG Deflection..."

# Create API troubleshooting article
curl -X POST "$API_BASE_URL/articles.create" \
  -H "Authorization: Bearer $DEVREV_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "API Rate Limiting Best Practices",
    "content": "## Understanding Rate Limits\nOur API implements fair usage policies:\n\n### Limits by Plan:\n- **Starter**: 1,000 requests/hour\n- **Professional**: 10,000 requests/hour\n- **Enterprise**: 100,000 requests/hour\n\n### Best Practices:\n1. Implement exponential backoff\n2. Cache responses when possible\n3. Use batch endpoints\n4. Monitor via dashboard\n\n### Upgrade Options:\nContact support for higher limits or plan upgrades.",
    "tags": ["api", "rate-limiting", "troubleshooting"],
    "category": "developer-resources",
    "visibility": "public"
  }'

echo ""
echo "KB Article created for API rate limiting"
