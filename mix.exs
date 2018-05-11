defmodule NhlGraphApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :nhl_graph_api,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {NhlGraphApi.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:absinthe, "~> 1.4"},
      {:absinthe_plug, "~> 1.4"},
      {:cowboy, "~> 1.0"},
      {:dataloader, "~> 1.0"},
      {:dialyze, "~> 0.2", only: :dev},
      {:distillery, "~> 1.5", runtime: false},
      {:httpotion, "~> 3.0"},
      {:poison, "~> 1.3"},
      {:plug, "~> 1.0"}
    ]
  end
end
