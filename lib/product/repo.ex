defmodule Product.Repo do
  use Ecto.Repo,
    otp_app: :product,
    adapter: Ecto.Adapters.Postgres
end
