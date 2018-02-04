defmodule NhlGraphApi.Loaders.Nhl do
  @teams %{
    "1" => %{
      id: 1,
      name: "foo team",
      city: "foo city",
      abbreviation: "foo abbrev"
    }
  }

  alias NhlGraphApi.Clients.NhlStatsApi

  def data() do
    Dataloader.KV.new(&fetch/2)
  end

  def fetch({:teams, _}, _) do
    teams =
      NhlStatsApi.teams()
      |> Enum.map(fn json -> team_from_json(json) end)

    %{%{} => teams}
  end

  def fetch({:team, %{id: id}}, _) do
    # must return a map keyed by args which is always %{}
    %{%{} => fetch_team_by_id(id)}
  end

  def fetch(batch, ids) do
    IO.inspect(batch: batch, ids: ids)
    %{}
  end

  def fetch_team_by_id(id) do
    NhlStatsApi.team(id) |> team_from_json
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
