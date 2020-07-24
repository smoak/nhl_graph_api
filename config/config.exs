# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :nhl_graph_api, NhlGraphApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2oVNSqlK5mxbcEAjb1sI0HG0fNHjCJ8K8KKvnSxN0eYLqRu1PFxrjVn3VYzXv2W2",
  render_errors: [view: NhlGraphApiWeb.ErrorView, accepts: ~w(json)]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Poison

config :tesla, adapter: Tesla.Adapter.Hackney

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
