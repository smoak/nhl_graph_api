defmodule NhlGraphApi.Models.Game do
  defstruct [:id, :start_time_utc, :away_team, :home_team]

  alias NhlGraphApi.Models.Team
  alias NhlGraphApi.Models.Game

  def new(%{id: id, start_time_utc: start_time_utc, away_team: away_team, home_team: home_team}) do
    {:ok, %__MODULE__{}}
    |> with_id(id)
    |> with_start_time_utc(start_time_utc)
    |> with_away_team(away_team)
    |> with_home_team(home_team)
  end

  def from_json(json) do
    away_team = json["teams"]["away"]["team"] |> Team.from_json()
    home_team = json["teams"]["home"]["team"] |> Team.from_json()
    id = json["gamePk"]
    start_time_utc = json["gameDate"]

    {:ok, game} =
      Game.new(%{
        id: id,
        start_time_utc: start_time_utc,
        away_team: away_team,
        home_team: home_team
      })

    game
  end

  defp with_id({:ok, game}, id) do
    {:ok, %{game | id: id}}
  end

  defp with_start_time_utc({:ok, game}, start_time_utc) do
    {:ok, %{game | start_time_utc: start_time_utc}}
  end

  defp with_away_team({:ok, game}, away_team) do
    {:ok, %{game | away_team: away_team}}
  end

  defp with_home_team({:ok, game}, home_team) do
    {:ok, %{game | home_team: home_team}}
  end
end
