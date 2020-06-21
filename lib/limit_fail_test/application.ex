defmodule LimitFailTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LimitFailTest.Repo,
      # Start the Telemetry supervisor
      LimitFailTestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LimitFailTest.PubSub},
      # Start the Endpoint (http/https)
      LimitFailTestWeb.Endpoint
      # Start a worker by calling: LimitFailTest.Worker.start_link(arg)
      # {LimitFailTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LimitFailTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LimitFailTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
