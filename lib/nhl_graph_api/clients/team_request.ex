defmodule NhlGraphApi.Clients.TeamRequest do
  @url "http://statsapi.web.nhl.com/api/v1/teams/"

  def get(id) do
    HTTPotion.get(@url <> id)
  end
end