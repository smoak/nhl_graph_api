defmodule NhlGraphApi.Serialization.Schedule do
  alias NhlGraphApi.Models.Schedule
  alias NhlGraphApi.Serialization.Game

  def from_json(json) do
    games =
      json["dates"]
      |> Enum.map(fn d -> d["games"] end)
      |> List.flatten()
      |> Enum.map(&Game.from_json/1)

    Schedule.new(%{games: games})
  end
end
