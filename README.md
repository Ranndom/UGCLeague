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

UGC.configure do |config|
    config.api_key      = "API Key"     # Obtain from a UGC admin.
    config.user_agent   = "User agent"  # User agent to be sent with the request.
end
```

Examples:

```
# Set the API key.
UGC.api_key = "API Key"

# Set the user agent.
UGC.user_agent = "User agent"

# Get a player's team history.
UGC.player_history(76561198063808035)

# Get a player's current team.
UGC.player_current(76561198063808035)
```

