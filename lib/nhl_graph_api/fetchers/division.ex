defmodule NhlGraphApi.Fetchers.Division do
  alias NhlGraphApi.Clients.NhlStatsApi

  def get_all() do
    NhlStatsApi.divisions()
  end

  def get_division_by_id(id) do
    NhlStatsApi.division(id)
  end
end
