defmodule NhlGraphApi.Clients.TeamsRequest do
  @url "http://statsapi.web.nhl.com/api/v1/teams"

  def get() do
    HTTPotion.get(@url)
  end
end