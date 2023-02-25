import Config
config :myapp, ecto_repos: [Myapp.Repo]
config :myapp, Myapp.Repo,
  hostname: "localhost",
  database: "myapp",
  username: "postgres",
  password: "postgres",
  migration_timestamps: [type: :timestamptz]
