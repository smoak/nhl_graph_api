defmodule NhlGraphApi.Fetchers.Conference do
  alias NhlGraphApi.Clients.NhlStatsApi

  def get_all() do
    NhlStatsApi.conferences()
  end

  def get_conference_by_id(id) do
    NhlStatsApi.conference(id)
  end
end
