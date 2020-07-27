defmodule NhlGraphApi.Fetchers.Team do
  @moduledoc """
  Fetches team data from the NhlStatsApi
  """
  alias NhlGraphApi.Clients.NhlStatsApi

  def get_all do
    NhlStatsApi.teams()
  end

  def get_team_by_id(id) do
    NhlStatsApi.team(id)
  end
end
