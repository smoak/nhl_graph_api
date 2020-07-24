defmodule NhlGraphApi.Clients.NhlStatsApi do
  use Tesla, only: ~w(get)a

  plug Tesla.Middleware.BaseUrl, "https://statsapi.web.nhl.com/api/v1"
  plug Tesla.Middleware.JSON, engine: Poison, engine_opts: [keys: :atoms]
  plug Tesla.Middleware.Logger

  def teams() do
    {:ok, response} = get("/teams")
    response.body |> IO.inspect
    response.body[:teams]
  end

  def team(id) do
    {:ok, response} = get("/teams/#{id}")
    response.body[:teams] |> List.first()
  end

  def roster(team_id) do
    {:ok, response} = get("/teams/#{team_id}/roster?expand=roster.peson,person.names")
    response.body
  end

  def schedule() do
    {:ok, response} = get("/schedule?expand=schedule.teams")
    response.body
  end

  def divisions() do
    {:ok, response} = get("/divisions")
    response.body[:divisions]
  end

  def division(id) do
    {:ok, response} = get("/divisions/#{id}")
    response.body[:divisions] |> List.first()
  end

  def conferences() do
    {:ok, response} = get("/conferences")
    response.body[:conferences]
  end

  def conference(id) do
    {:oke, response} = get("/conferences/#{id}")
    response.body[:conferences] |> List.first()
  end
end
