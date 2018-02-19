defmodule NhlGraphApi.Clients.ScheduleRequest do
  @url "http://statsapi.web.nhl.com/api/v1/schedule?expand=schedule.teams"

  def get() do
    HTTPotion.get(@url)
  end
end