defmodule NhlGraphApi.Repos.Schedule do
  alias NhlGraphApi.Fetchers.Schedule

  def find_all() do
    Schedule.get_all() |> Enum.map(&map_schedule/1)
  end

  defp map_schedule(fetched_schedule) do
    %{}
  end
end
