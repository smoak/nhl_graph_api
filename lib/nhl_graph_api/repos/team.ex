defmodule NhlGraphApi.Repos.Team do
  alias NhlGraphApi.Fetchers.Team

  def find_all() do
    Team.get_all() |> Enum.map(&map_team/1)
  end

  def find_by_id(id) do
    Team.get_team_by_id(id) |> map_team
  end

  defp map_team(fetched_team) do
    %{
      id: fetched_team |> Map.get("id"),
      name: fetched_team |> Map.get("name"),
      abbreviation: fetched_team |> Map.get("abbreviation"),
      city: fetched_team |> Map.get("venue") |> Map.get("city")
    }
  end
end
