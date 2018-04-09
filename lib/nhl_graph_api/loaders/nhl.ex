defmodule NhlGraphApi.Loaders.Nhl do
  alias NhlGraphApi.Models.Team
  alias NhlGraphApi.Models.Schedule
  alias NhlGraphApi.Models.Division

  def data() do
    Dataloader.KV.new(&fetch/2)
  end

  def fetch(:schedule, _) do
    schedule = Schedule.get()
    %{%{} => schedule}
  end

  def fetch(:team, %{id: id}) do
    %{%{id: id} => Team.find_by_id(id)}
  end

  def fetch(:team, args) do
    args
    |> Enum.reduce(%{}, fn arg, result -> result |> Map.merge(fetch(:team, arg)) end)
  end

  def fetch(:teams, _) do
    %{%{} => Team.all()}
  end

  def fetch(:divisions, _) do
    %{%{} => Division.all()}
  end

  def fetch(batch, args) do
    IO.inspect(batch: batch, args: args)
    %{}
  end
end
