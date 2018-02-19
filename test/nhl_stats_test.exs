defmodule NhlStatsTest do
  use ExUnit.Case
  import Mock

  alias NhlGraphApi.Clients.NhlStats
  alias NhlGraphApi.Clients.ScheduleRequest
  alias NhlGraphApi.Clients.TeamsRequest

  describe "#schedule" do
    test "should make a schedule request for the schedule" do
      with_mock ScheduleRequest, [get: fn() -> %HTTPotion.Response{status_code: 200, body: "{}"} end] do
        NhlStats.schedule()
        assert called ScheduleRequest.get()
      end
    end
  end

  describe "#teams" do
    test "should make a team request for all the teams" do
      with_mock TeamsRequest, [get: fn() -> %HTTPotion.Response{status_code: 200, body: "{}"} end] do
        NhlStats.teams()
        assert called TeamsRequest.get()
      end
    end
  end
end