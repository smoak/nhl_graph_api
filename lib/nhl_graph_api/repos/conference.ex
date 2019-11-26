defmodule NhlGraphApi.Repos.Conference do
  alias NhlGraphApi.Fetchers.Conference

  def find_all() do
    Conference.get_all() |> Enum.map(&map_conference/1)
  end

  def find_by_id(id) do
    Conference.get_conference_by_id(id) |> map_conference
  end

  defp map_conference(fetched_conference) do
    %{
      id: fetched_conference |> Map.get("id"),
      name: fetched_conference |> Map.get("name"),
      abbreviation: fetched_conference |> Map.get("abbreviation"),
      short_name: fetched_conference |> Map.get("shortName"),
      active: fetched_conference |> Map.get("active")
    }
  end
end
