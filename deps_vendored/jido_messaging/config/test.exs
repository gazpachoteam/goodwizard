import Config

# Configuration for test environment

# Nostrum requires a token with valid format (base64-encoded user ID + timestamp + hmac)
# Using manual sharding prevents nostrum from trying to connect to Discord
config :nostrum,
  token: "REDACTED",
  num_shards: :manual
