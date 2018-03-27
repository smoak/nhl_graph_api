defmodule NhlGraphApi.Models.Division do
  defstruct [:id, :name, :abbreviation, :active, :conference_id]

  alias NhlGraphApi.Models.Division
  alias NhlGraphApi.Clients.NhlStatsApi

  def new(%{id: id, name: name, abbreviation: abbreviation, active: active, conference_id: conference_id}) do
    {:ok, %__MODULE__{}}
    |> with_id(id)
    |> with_name(name)
    |> with_abbreviation(abbreviation)
    |> with_active(active)
    |> with_conference_id(conference_id)
  end

  def with_id({:ok, division}, id) do
    {:ok, %{division | id: id}}
  end

  def with_name({:ok, division}, name) do
    {:ok, %{division | name: name}}
  end

  def with_abbreviation({:ok, division}, abbreviation) do
    {:ok, %{division | abbreviation: abbreviation}}
  end

  def with_active({:ok, division}, active) do
    {:ok, %{division | active: active}}
  end

  def with_conference_id({:ok, division}, conference_id) do
    {:ok, %{division | conference_id: conference_id}}
  end

  def from_json(json) do
    {:ok, division} = Division.new(%{
      id: json["id"],
      name: json["name"],
      abbreviation: json["abbreviation"],
      active: json["active"],
      conference_id: json["conference"]["id"]
    })
    division
  end

  def all(division_source \\ NhlStatsApi) do
    division_source.divisions()
    |> Enum.map(&from_json/1)
  end
end