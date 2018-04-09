defmodule NhlGraphApi.Models.Schedule do
  defstruct [:games]

  alias NhlGraphApi.Clients.NhlStatsApi
  alias NhlGraphApi.Models.Game
  alias NhlGraphApi.Models.Schedule

  def new(%{games: games}) do
    {:ok, %__MODULE__{}}
    |> with_games(games)
  end

  def get(schedule_source \\ NhlStatsApi) do
    schedule_source.schedule()
    |> schedule_from_json()
  end

  defp with_games({:ok, schedule}, games) do
    {:ok, %{schedule | games: games}}
  end

  defp schedule_from_json(json) do
    games =
      json["dates"]
      |> Enum.map(fn d -> d["games"] end)
      |> List.flatten()
      |> Enum.map(&Game.from_json/1)

    {:ok, schedule} = Schedule.new(%{games: games})
    schedule
  end
end
