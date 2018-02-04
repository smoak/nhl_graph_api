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

  def fetch({:teams, _}, _) do
    %{ %{} => @teams |> Map.values() }
  end

  def fetch({:team, %{id: id}}, _) do
    # must return a map keyed by args which is always %{}
    %{ %{} => fetch_team_by_id(id) }
  end

  def fetch(batch, ids) do
    IO.inspect(batch: batch, ids: ids)
    %{}
  end

  def fetch_team_by_id(id) do
    @teams |> Map.get(id)
  end
end
