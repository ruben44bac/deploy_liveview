# Since configuration is shared in umbrella projects, this file
# should only configure the :tester_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :tester_web,
  ecto_repos: [Tester.Repo],
  generators: [context_app: :tester]

# Configures the endpoint
config :tester_web, TesterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Rd1hcUkhJadTo+HG+G8695Hav10zNY5x3VE7hMwTxQfvpQhG0BshOoHMu/8XiGuC",
  render_errors: [view: TesterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TesterWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "p5Iu1Xexpf3kditakIQqVTNev4AUJW+h"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
