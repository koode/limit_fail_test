# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :limit_fail_test,
  ecto_repos: [LimitFailTest.Repo]

# Configures the endpoint
config :limit_fail_test, LimitFailTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ukJwXEh0PIlbILeM+/+HNO7jYU0skleoIqsmtMB9s/ilhJRJlhb5BjifjPkKuzLe",
  render_errors: [view: LimitFailTestWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: LimitFailTest.PubSub,
  live_view: [signing_salt: "Y2cQQD1w"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
