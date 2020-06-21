defmodule LimitFailTest.Repo do
  use Ecto.Repo,
    otp_app: :limit_fail_test,
    adapter: Ecto.Adapters.Postgres
end
