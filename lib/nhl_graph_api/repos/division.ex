defmodule NhlGraphApi.Repos.Division do
  @moduledoc """
  Repo for fetching a division and cleaning up the
  representation for use with graphql
  """
  alias NhlGraphApi.Fetchers.Division

  def find_all do
    Division.get_all() |> Enum.map(&map_division/1)
  end

  def find_by_id(id) do
    Division.get_division_by_id(id) |> map_division
  end

  defp map_division(fetched_division) do
    %{
      id: fetched_division |> Map.get(:id),
      name: fetched_division |> Map.get(:name),
      abbreviation: fetched_division |> Map.get(:abbreviation),
      conference: fetched_division |> map_conference,
      active: fetched_division |> Map.get(:active)
    }
  end

  defp map_conference(fetched_division) do
    %{
      id: fetched_division |> Map.get(:conference) |> Map.get(:id)
    }
  end
end
