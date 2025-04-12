defmodule AproveJiuJitsu.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AproveJiuJitsuWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:aprove_jiu_jitsu, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AproveJiuJitsu.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: AproveJiuJitsu.Finch},
      # Start a worker by calling: AproveJiuJitsu.Worker.start_link(arg)
      # {AproveJiuJitsu.Worker, arg},
      # Start to serve requests, typically the last entry
      AproveJiuJitsuWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AproveJiuJitsu.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AproveJiuJitsuWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
