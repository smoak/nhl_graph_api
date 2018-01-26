defmodule NhlGraphApi.Schema do
  use Absinthe.Schema
  import_types(NhlGraphApi.Schema.ContentTypes)

  import Absinthe.Resolution.Helpers

  alias NhlGraphApi.NhlApi

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(NhlApi, NhlApi.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  query do
    field(:teams, list_of(:team), resolve: load(NhlApi))

    field :team, :team do
      arg(:id, non_null(:id))
      resolve(load(NhlApi))
    end
  end

  # Reusable dataloader helper replacement for simple KV use.
  #
  # This serves the same purpose as the `dataloader` helper, but
  # as that's currently focused on batching by parent (object) for Ecto,
  # we (currently) need to do some special handling.
  def load(source_name) do
    fn _, args, %{context: %{loader: loader}} ->
      # The `nil` values here is the batch key; all batching
      # for the source automatically done together.
      loader
      |> Dataloader.load(source_name, nil, args)
      |> on_load(fn loader ->
        {:ok, Dataloader.get(loader, source_name, nil, args)}
      end)
    end
  end
end
