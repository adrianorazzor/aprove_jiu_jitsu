defmodule AproveJiuJitsu.Repo do
  use Ecto.Repo,
    otp_app: :aprove_jiu_jitsu,
    adapter: Ecto.Adapters.Postgres
end
