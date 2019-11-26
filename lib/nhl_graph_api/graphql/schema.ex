defmodule NhlGraphApi.GraphQL.Schema do
  @moduledoc """
  The main GraphQL schema.
  """
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types(NhlGraphApi.GraphQL.Types.Conference)
  import_types(NhlGraphApi.GraphQL.Types.Division)
  # import_types(NhlGraphApi.GraphQL.Types.Game)
  # import_types(NhlGraphApi.GraphQL.Types.Schedule)
  # import_types(NhlGraphApi.GraphQL.Types.Team)

  alias NhlGraphApi.GraphQL.Resolvers.Division
  alias NhlGraphApi.GraphQL.Resolvers.Conference
  # alias NhlGraphApi.GraphQL.Resolvers.Schedule
  # alias NhlGraphApi.GraphQL.Resolvers.Team

  node interface do
    resolve_type(fn
      _, _ -> nil
    end)
  end

  query do
    # field(:teams, list_of(:team), resolve: &Team.list/3)

    # field :team, :team do
    #   arg(:id, non_null(:id))
    #   resolve(load(:nhl_api))
    # end

    # field :schedule, :schedule do
    #   resolve(&Schedule.list/3)
    # end

    field(:divisions, list_of(:division), resolve: &Division.list/3)

    field(:division, :division) do
      arg(:id, non_null(:id))

      middleware(Absinthe.Relay.Node.ParseIDs, id: :division)
      resolve(&Division.by_id/3)
    end

    field(:conferences, list_of(:conference), resolve: &Conference.list/3)

    field(:conference, :conference) do
      arg(:id, non_null(:id))

      middleware(Absinthe.Relay.Node.ParseIDs, id: :conference)
      resolve(&Conference.by_id/3)
    end
  end
end
