defmodule NhlGraphApi.Loaders.Nhl do
  alias NhlGraphApi.Clients.NhlStatsApi

  def data() do
    Dataloader.KV.new(&fetch/2)
  end

  def fetch(:team, %{id: id}) do
    %{ %{id: id} => fetch_team_by_id(id) }
  end

  def fetch(:team, args) do
    args
    |> Enum.reduce(%{}, fn (arg, result) -> result |> Map.merge(fetch(:team, arg)) end)
  end

  def fetch(:teams, _) do
    %{%{} => fetch_all_teams()}
  end

  def fetch(batch, args) do
    IO.inspect(batch: batch, args: args)
    %{}
  end

  def fetch_team_by_id(id) do
    NhlStatsApi.team(id) |> team_from_json
  end

  def fetch_all_teams() do
    NhlStatsApi.teams()
    |> Enum.map(&team_from_json/1)
  end

  defp team_from_json(json) do
    %{
      id: json["id"],
      name: json["name"],
      city: json["locationName"],
      abbreviation: json["abbreviation"]
    }
  end
end
