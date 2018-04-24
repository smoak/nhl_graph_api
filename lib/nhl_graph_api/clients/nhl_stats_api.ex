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

  def roster(team_id) do
    get("/teams/#{team_id}/roster?expand=roster.peson,person.names").body
  end

  def schedule() do
    get("/schedule?expand=schedule.teams").body
  end

  def divisions() do
    get("/divisions").body["divisions"]
  end

  def division(id) do
    get("/divisions/#{id}").body["divisions"] |> List.first()
  end

  def conferences() do
    get("/conferences").body["conferences"]
  end

  def conference(id) do
    get("/conferences/#{id}").body["conferences"] |> List.first()
  end
end
