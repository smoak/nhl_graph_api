defmodule NhlGraphApi.Loaders.Nhl do
  alias NhlGraphApi.Connectors.Nhl

  def data() do
    Dataloader.KV.new(&fetch/2)
  end

  def fetch(:team, %{id: id}) do
    %{%{id: id} => Nhl.get_team_by_id(id)}
  end

  def fetch(:team, args) do
    args
    |> Enum.reduce(%{}, fn arg, result -> result |> Map.merge(fetch(:team, arg)) end)
  end

  def fetch(:division, %{id: id}) do
    %{%{id: id} => Nhl.get_division_by_id(id)}
  end

  def fetch(:division, args) do
    args
    |> Enum.reduce(%{}, fn arg, result ->
      result |> Map.merge(fetch(:division, arg))
    end)
  end

  def fetch(batch, args) do
    IO.inspect(batch: batch, args: args)
    %{}
  end
end
