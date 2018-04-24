defmodule NhlGraphApi.Serialization.Game do
  alias NhlGraphApi.Serialization.Team
  alias NhlGraphApi.Models.Game

  def from_json(json) do
    away_team = json["teams"]["away"]["team"] |> Team.from_json()
    home_team = json["teams"]["home"]["team"] |> Team.from_json()
    id = json["gamePk"]
    start_time_utc = json["gameDate"]

    Game.new(%{
      id: id,
      start_time_utc: start_time_utc,
      away_team: away_team,
      home_team: home_team
    })
  end
end
