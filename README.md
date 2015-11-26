# NOTE: The admin who uploaded the API spec to GitHub has since removed the Gist. Unsure if the API is still available.

# UGC League

UGCLeague is a Ruby client for the UGC League API.

## Installation

Install it from RubyGems:

```
gem install ugcleague
```

Or add it to a Gemfile:

```
gem 'ugcleague'
```

## Usage

Configuration:

```
require 'ugcleague'

UGCLeague.configure do |config|
    config.api_key      = "API Key"     # Obtain from a UGC admin.
    config.user_agent   = "User agent"  # User agent to be sent with the request.
    config.debug        = false         # Whether to print debug messages.
end
```

Examples:

```
# Set the API key.
UGCLeague.api_key = "API Key"

# Set the user agent.
UGCLeague.user_agent = "User agent"

# Set debug.
UGCLeague.debug = true

# Checks if the player has a profile on UGC.
UGCLeague.player_has_profile(76561198063808035)

# Get a player's team history.
UGCLeague.player_history(76561198063808035)

# Get a player's current team.
UGCLeague.player_current(76561198063808035)
```

