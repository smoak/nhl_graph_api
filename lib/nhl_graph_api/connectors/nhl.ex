defmodule NhlGraphApi.Connectors.Nhl do
  alias NhlGraphApi.Clients.NhlStatsApi
  alias NhlGraphApi.Serialization.Team
  alias NhlGraphApi.Serialization.Schedule
  alias NhlGraphApi.Serialization.Division

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

  def get_all_divisions() do
    NhlStatsApi.divisions()
    |> Enum.map(fn d ->
      d |> Division.from_json()
    end)
  end

  def get_division_by_id(id) do
    NhlStatsApi.division(id)
    |> Division.from_json()
  end
end
