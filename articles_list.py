import requests
import os

def get_devrev_token():
    """Reads the DevRev API token from the token file."""
    token_file = os.path.expanduser("~/Documents/API_testing/.api_token")
    try:
        with open(token_file, "r") as f:
            return f.read().strip()
    except FileNotFoundError:
        print(f"Error: Token file not found at {token_file}")
        return None

def list_articles():
    """Fetches and prints a list of articles from the DevRev API."""
    token = get_devrev_token()
    if not token:
        return

    api_base_url = "https://api.devrev.ai"
    url = f"{api_base_url}/articles.list"

    headers = {
        "Authorization": f"Bearer {token}",
        "Accept": "application/json"
    }

    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for HTTP errors (4xx or 5xx)
        articles = response.json()
        print("Successfully fetched articles:")
        print(articles)
    except requests.exceptions.RequestException as e:
        print(f"Error fetching articles: {e}")
    except ValueError as e:
        print(f"Error decoding JSON response: {e}")

if __name__ == "__main__":
    list_articles()
