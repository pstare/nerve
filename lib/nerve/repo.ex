defmodule Nerve.Repo do
  use Ecto.Repo,
    otp_app: :nerve,
    adapter: Ecto.Adapters.Postgres
end
