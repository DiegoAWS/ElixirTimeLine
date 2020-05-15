defmodule Chrip.Repo do
  use Ecto.Repo,
    otp_app: :chrip,
    adapter: Ecto.Adapters.Postgres
end
