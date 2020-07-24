defmodule NhlGraphApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :nhl_graph_api,
      version: "1.0.0",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "NhlGraphApi",
      source_url: "https://github.com/smoak/nhl_graph_api",
      docs: [
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {NhlGraphApi.Application, []}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:absinthe_phoenix, "~> 2.0"},
      {:absinthe_plug, "~> 1.5"},
      {:absinthe_relay, "~> 1.5"},
      {:absinthe, "~> 1.5"},
      {:dataloader, "~> 1.0"},
      {:dialyze, "~> 0.2", only: :dev},
      {:hackney, "~> 1.16"},
      {:phoenix, "~> 1.5"},
      {:plug_cowboy, "~> 2.3"},
      {:plug, "~> 1.10"},
      {:poison, "~> 4.0"},
      {:tesla, "~> 1.3"}
    ]
  end
end
