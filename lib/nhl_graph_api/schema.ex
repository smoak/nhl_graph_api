defmodule NhlGraphApi.Schema do
  use Absinthe.Schema
  import_types(NhlGraphApi.Schema.ContentTypes)

  import Absinthe.Resolution.Helpers

  alias NhlGraphApi.Loaders.Nhl

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Nhl, Nhl.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  query do
    field(:teams, list_of(:team), resolve: load(Nhl))

    field :team, :team do
      arg(:id, non_null(:id))
      resolve(load(Nhl))
    end

    field :schedule, :schedule do
      resolve(load(Nhl))
    end

    field(:divisions, list_of(:division), resolve: load(Nhl))

    field(:division, :division) do
      arg(:id, non_null(:id))
      resolve(load(Nhl))
    end
  end

  def load(source) do
    fn _, args, %{context: %{loader: loader}} = res ->
      resource = res.definition.schema_node.identifier

      loader
      |> Dataloader.load(source, resource, args)
      |> on_load(fn loader ->
        {:ok, Dataloader.get(loader, source, resource, args)}
      end)
    end
  end
end
