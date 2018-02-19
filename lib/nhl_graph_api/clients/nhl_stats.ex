defmodule NhlGraphApi.Clients.NhlStats do
  alias NhlGraphApi.Clients.ScheduleRequest
  alias NhlGraphApi.Clients.TeamsRequest
  alias NhlGraphApi.Clients.TeamRequest

  def schedule() do
    case ScheduleRequest.get() do
      %HTTPotion.Response{status_code: 200, body: body} ->
        {:ok, json } = Poison.decode(body)
        json
      %HTTPotion.ErrorResponse{message: message} ->
        {:error, message}
    end
  end

  def teams() do
    case TeamsRequest.get() do
      %HTTPotion.Response{status_code: 200, body: body} ->
        {:ok, json} = Poison.decode(body)
        json["teams"]
      %HTTPotion.ErrorResponse{message: message} ->
        {:error, message}
    end
  end

  def team(id) do
    case TeamRequest.get(id) do
      %HTTPotion.Response{status_code: 200, body: body} ->
        {:ok, json} = Poison.decode(body)
        json["teams"] |> List.first()
      %HTTPotion.ErrorResponse{message: message} ->
        {:error, message}
    end
  end
end
