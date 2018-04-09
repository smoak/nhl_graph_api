defmodule NhlGraphApi.Models.Team do
  defstruct [:id, :city, :name, :abbreviation]

  alias NhlGraphApi.Models.Team
  alias NhlGraphApi.Clients.NhlStatsApi

  def new(%{id: id, city: city, name: name, abbreviation: abbreviation}) do
    {:ok, %__MODULE__{}}
    |> with_id(id)
    |> with_city(city)
    |> with_name(name)
    |> with_abbreviation(abbreviation)
  end

  def all(team_source \\ NhlStatsApi) do
    team_source.teams()
    |> Enum.map(&from_json/1)
  end

  def find_by_id(id, team_source \\ NhlStatsApi) do
    team_source.team(id)
    |> from_json()
  end

  def from_json(json) do
    {:ok, team} =
      Team.new(%{
        id: json["id"],
        city: json["locationName"],
        name: json["name"],
        abbreviation: json["abbreviation"]
      })

    team
  end

  defp with_id({:ok, team}, id) do
    {:ok, %{team | id: id}}
  end

  defp with_city({:ok, team}, city) do
    {:ok, %{team | city: city}}
  end

  defp with_name({:ok, team}, name) do
    {:ok, %{team | name: name}}
  end

  defp with_abbreviation({:ok, team}, abbreviation) do
    {:ok, %{team | abbreviation: abbreviation}}
  end
end
