defmodule NhlGraphApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: NhlGraphApi.Worker.start_link(arg)
      # {NhlGraphApi.Worker, arg},
      Plug.Adapters.Cowboy.child_spec(:http, NhlGraphApi.Web.Api, [], port: 8080)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NhlGraphApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
