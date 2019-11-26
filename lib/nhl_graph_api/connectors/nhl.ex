defmodule NhlGraphApi.Connectors.Nhl do
  alias NhlGraphApi.Clients.NhlStatsApi
  alias NhlGraphApi.Serialization.Team
  alias NhlGraphApi.Serialization.Schedule

  @spec get_all_teams() :: list(NhlGraphApi.Models.Team.t())
  def get_all_teams() do
    NhlStatsApi.teams()
    |> Enum.map(fn t ->
      t |> Team.from_json()
    end)
  end

  def get_team_by_id(id) do
    NhlStatsApi.team(id)
    |> Team.from_json()
  end

  def get_schedule() do
    NhlStatsApi.schedule()
    |> Schedule.from_json()
  end
end
