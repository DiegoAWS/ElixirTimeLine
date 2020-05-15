# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chrip,
  ecto_repos: [Chrip.Repo]

# Configures the endpoint
config :chrip, ChripWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AyT+zfD67T0Z3aeTF228Hms+U/zbYnVtfrICC0o//vnnt/rh+SZRrSzKHaOS52Cx",
  render_errors: [view: ChripWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chrip.PubSub,
  live_view: [signing_salt: "WFFRk2r/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
