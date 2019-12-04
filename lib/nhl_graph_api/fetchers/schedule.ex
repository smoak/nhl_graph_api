defmodule NhlGraphApi.Fetchers.Schedule do
  alias NhlGraphApi.Clients.NhlStatsApi

  def get_all() do
    NhlStatsApi.schedule()
  end
end
