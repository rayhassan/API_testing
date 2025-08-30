import requests
import os
import json

def get_devrev_token():
    """Reads the DevRev API token from the token file."""
    token_file = os.path.expanduser("~/Documents/API_testing/.api_token")
    try:
        with open(token_file, "r") as f:
            return f.read().strip()
    except FileNotFoundError:
        print(f"Error: Token file not found at {token_file}")
        return None

def create_article(payload):
    """Creates an article using the DevRev API with the given payload."""
    token = get_devrev_token()
    if not token:
        return

    api_base_url = "https://api.devrev.ai"
    url = f"{api_base_url}/articles.create"

    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json"
    }

    try:
        response = requests.post(url, headers=headers, data=json.dumps(payload))
        response.raise_for_status()  # Raise an exception for HTTP errors (4xx or 5xx)
        article_data = response.json()
        print(f"Successfully created article: {article_data.get('article', {}).get('title', 'No title')}")
        print(article_data)
    except requests.exceptions.RequestException as e:
        print(f"Error creating article: {e}")
        if e.response is not None:
            print(f"Response content: {e.response.text}")
    except ValueError as e:
        print(f"Error decoding JSON response: {e}")

if __name__ == "__main__":
    article_payloads = [
        {
            "owned_by": [
                "SYSU-1"
            ],
            "resource": {
                "url": "safc.com"
            },
            "title": "new signings article",
            "status": "review_needed"
        },
        {
            "owned_by": [
                "SYSU-1"
            ],
            "resource": {
                "url": "bbc.co.uk"
            },
            "title": "Enterprise SSO Authentication Failure - All Users Affected",
            "description": "Complete SSO failure affecting all 500+ enterprise users. Unable to authenticate since 2PM EST. Business critical - blocking all productivity.",
            "status": "review_needed"
        },
        {
            "owned_by": [
                "SYSU-1"
            ],
            "resource": {
                "url": "nist.gov"
            },
            "title": "How do I bulk export customer data for compliance audit?",
            "description": "We need to export all customer data for our quarterly compliance audit. Cannot find bulk export option in the UI. Need CSV format with all fields.",
            "status": "review_needed"
        }
    ]

    for i, payload in enumerate(article_payloads):
        print(f"\n--- Creating Article {i + 1} ---")
        create_article(payload)
