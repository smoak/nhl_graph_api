defmodule TeamRequestTest do
  use ExUnit.Case
  import Mock

  alias NhlGraphApi.Clients.TeamRequest

  describe "#get" do
    test "should make a http request to the nhl stats api" do
      with_mock HTTPotion, [get: fn(_url) -> %HTTPotion.Response{status_code: 200, body: "{}"} end] do
        TeamRequest.get("1")
        assert called HTTPotion.get("http://statsapi.web.nhl.com/api/v1/teams/1")
      end
    end
  end 
end