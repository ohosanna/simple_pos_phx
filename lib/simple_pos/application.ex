defmodule SimplePos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SimplePosWeb.Telemetry,
      SimplePos.Repo,
      {DNSCluster, query: Application.get_env(:simple_pos, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SimplePos.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SimplePos.Finch},
      # Start a worker by calling: SimplePos.Worker.start_link(arg)
      # {SimplePos.Worker, arg},
      # Start to serve requests, typically the last entry
      SimplePosWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimplePos.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SimplePosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
