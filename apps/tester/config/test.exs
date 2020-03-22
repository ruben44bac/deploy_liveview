# Since configuration is shared in umbrella projects, this file
# should only configure the :tester application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :tester, Tester.Repo,
  username: "postgres",
  password: "postgres",
  database: "tester_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
