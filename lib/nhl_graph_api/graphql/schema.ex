defmodule NhlGraphApi.GraphQL.Schema do
  @moduledoc """
  The main GraphQL schema.
  """
  use Absinthe.Schema
  
  import_types(NhlGraphApi.GraphQL.Types.Conference)
  import_types(NhlGraphApi.GraphQL.Types.Division)
  import_types(NhlGraphApi.GraphQL.Types.Game)
  import_types(NhlGraphApi.GraphQL.Types.Schedule)
  import_types(NhlGraphApi.GraphQL.Types.Team)

  import Absinthe.Resolution.Helpers

  alias NhlGraphApi.GraphQL.Resolvers.Division
  alias NhlGraphApi.GraphQL.Resolvers.Schedule
  alias NhlGraphApi.GraphQL.Resolvers.Team

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(:nhl_api, NhlGraphApi.Loaders.Nhl.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  query do
    field(:teams, list_of(:team), resolve: &Team.list/3)

    field :team, :team do
      arg(:id, non_null(:id))
      resolve(load(:nhl_api))
    end

    field :schedule, :schedule do
      resolve(&Schedule.list/3)
    end

    field(:divisions, list_of(:division), resolve: &Division.list/3)

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
