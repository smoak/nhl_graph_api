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
    field(:teams, list_of(:team), resolve: dataloader(Nhl))

    field :team, :team do
      arg(:id, non_null(:id))
      resolve(dataloader(Nhl))
    end
  end
end
