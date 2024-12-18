defmodule SimplePos.Repo do
  use Ecto.Repo,
    otp_app: :simple_pos,
    adapter: Ecto.Adapters.Postgres
end
