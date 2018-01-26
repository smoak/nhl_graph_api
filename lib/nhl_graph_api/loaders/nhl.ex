defmodule NhlGraphApi.Loaders.Nhl do
  @teams %{
    "1" => %{
      id: 1,
      name: "foo team",
      city: "foo city",
      abbreviation: "foo abbrev"
    }
  }

  def data() do
    Dataloader.KV.new(&fetch/2)
  end

  def fetch(batch_key, arg_maps) do
    IO.inspect(arg_maps: arg_maps, batch_key: batch_key)

    arg_maps
    |> Enum.map(&load/1)
    |> Enum.reduce(%{}, fn map, acc -> Map.merge(acc, map) end)
  end

  defp load(%{id: id}) do
    %{%{id: id} => @teams |> Map.get(id)}
  end

  defp load(%{}) do
    %{%{} => @teams |> Map.values()}
  end
end
