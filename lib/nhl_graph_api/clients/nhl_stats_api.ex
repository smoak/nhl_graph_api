defmodule NhlGraphApi.Clients.NhlStatsApi do
  use HTTPotion.Base

  def process_url(url) do
    "http://statsapi.web.nhl.com/api/v1/" <> url
  end

  def process_response_body(body) do
    body
    |> IO.iodata_to_binary()
    |> Poison.decode!()
  end

  def teams() do
    get("/teams").body["teams"]
  end

  def team(id) do
    get("/teams/#{id}").body["teams"] |> List.first()
  end

  def schedule() do
    get("/schedule?expand=schedule.teams").body
  end
end
