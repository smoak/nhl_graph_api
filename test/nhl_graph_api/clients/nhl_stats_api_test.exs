defmodule NhlGraphApi.Clients.NhlStatsApiTest do
  @moduledoc """
  The tests for NhlStatsApi
  """
  use ExUnit.Case

  import Tesla.Mock

  alias NhlGraphApi.Clients.NhlStatsApis

  @expected_team %{id: 1, name: "Test team"}

  setup do
    mock(fn
      %{url: "https://statsapi.web.nhl.com/api/v1/teams"} ->
        json(%{"teams" => []})

      %{url: "https://statsapi.web.nhl.com/api/v1/teams/1"} ->
        json(%{"teams" => [@expected_team]})
    end)

    :ok
  end

  test ".teams returns empty" do
    teams = NhlStatsApi.teams()
    assert teams == []
  end

  test ".team with an id returns a team" do
    team = NhlStatsApi.team("1")
    assert team == @expected_team
  end
end
