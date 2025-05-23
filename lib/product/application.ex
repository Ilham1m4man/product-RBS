defmodule Product.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ProductWeb.Telemetry,
      Product.Repo,
      {DNSCluster, query: Application.get_env(:product, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Product.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Product.Finch},
      # Start a worker by calling: Product.Worker.start_link(arg)
      # {Product.Worker, arg},
      # Start to serve requests, typically the last entry
      ProductWeb.Endpoint,
      {Cachex, [:product_cache]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Product.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ProductWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
